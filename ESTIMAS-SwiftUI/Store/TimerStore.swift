//
//  TimerStore.swift
//  ESTIMAS-SwiftUI
//
//  Created by Jakub Dobry on 07/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import Foundation

class TimerStore : ObservableObject {
    @Published var workItem: WorkItem?
    @Published var loading: Bool = false

    init() {
    }

    func fetchLastTask() {
        self.loading = true

        getLastWorkItem() { workItem in
            self.workItem = workItem
            self.loading = false
        }
    }

    func startTimer(activity: Activity) {
        self.loading = true

        startTask(activity: activity) {
            self.fetchLastTask()
        }
    }

    func endTimer() {
        self.workItem = nil
        endLastTask {
        }
    }
}
