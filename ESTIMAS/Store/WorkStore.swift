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
    @Published var state: FETCH_STATE = .loading

    init() {
    }

    func fetchWorkItems(_ completion: @escaping () -> Void = {}) {
        state = .loading

        let date = Date()

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        let dayString = dateFormatter.string(from: date)

        getWorkItems(startDay: dayString, endDay: dayString, {
            self.state = .error
            completion()
        }) { array in
            self.workItems = array
            self.state = .success
            completion()
        }
    }

    func removeWorkItem(workItem: WorkItem) {
        ESTIMAS.removeWorkItem(workItem: workItem) {
            self.fetchWorkItems()
        }
    }

    func editWorkItem(workItem: WorkItem, startDate: Date, endDate: Date) {
        ESTIMAS.editWorkItem(workItem: workItem, startDate: startDate, endDate: endDate) {
            self.fetchWorkItems()
        }
    }
}
