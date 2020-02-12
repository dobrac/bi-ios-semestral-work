//
//  TimerStore.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 07/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import Foundation

class TimerStore : ObservableObject {
    @Published var workItem: WorkItem?
    @Published var state: FETCH_STATE = .hardLoading

    var sessionStore: SessionStore

    init(sessionStore: SessionStore) {
        self.sessionStore = sessionStore
    }

    private func setupLoading() {
        if (state == .error) {
            state = .hardLoading
        } else {
            state = .softLoading
        }
    }

    func fetchLastTask(showLoading: Bool = true) {
        if (showLoading) {
            setupLoading()
        }

        getLastWorkItem({
            self.state = .error
        }) { workItem in
            self.workItem = workItem
            self.state = .success
        }
    }

    func startTimer(activity: Activity) {
        setupLoading()

        startTask(activity: activity) {
            self.fetchLastTask()
            self.sessionStore.workStore.fetchWorkItems()
        }
    }

    func endTimer() {
        self.workItem = nil
        endLastTask {
            self.sessionStore.workStore.fetchWorkItems()
            self.sessionStore.statsStore.fetchStats()
        }
    }
}
