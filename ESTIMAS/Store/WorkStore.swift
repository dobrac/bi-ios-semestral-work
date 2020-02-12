//
//  WorkStore.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 08/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import Foundation

class WorkStore : ObservableObject {
    @Published var workItems: [WorkItem] = []
    @Published var loading: Bool = false
    @Published var error: Bool = false

    init() {
    }

    func fetchWorkItems() {
        loading = true
        error = false

        let date = Date()

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        let dayString = dateFormatter.string(from: date)

        getWorkItems(startDay: dayString, endDay: dayString, {
            self.error = true
            self.loading = false
        }) { array in
            self.workItems = array
            self.loading = false
        }
    }

    func removeWorkItem(workItem: WorkItem) {
        loading = true
        ESTIMAS.removeWorkItem(workItem: workItem) {
            self.fetchWorkItems()
        }
    }

    func editWorkItem(workItem: WorkItem, startDate: Date, endDate: Date) {
        loading = true
        ESTIMAS.editWorkItem(workItem: workItem, startDate: startDate, endDate: endDate) {
            self.fetchWorkItems()
        }
    }
}
