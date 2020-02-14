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
    @Published var state: FETCH_STATE = .loading

    var sessionStore: SessionStore

    init(sessionStore: SessionStore) {
        self.sessionStore = sessionStore
    }

    func fetchLastTask(_ completion: @escaping () -> Void = {}) {
        getLastWorkItem({
            self.state = .error
            completion()
        }) { workItem in
            self.workItem = workItem
            self.state = .success
            completion()
        }
    }

    func startTimer(activity: Activity) {
        state = .loading

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
