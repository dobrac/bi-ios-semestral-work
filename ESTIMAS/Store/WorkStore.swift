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

    init() {
    }

    func fetchWorkItems() {
        let date = Date()

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        let dayString = dateFormatter.string(from: date)

        getWorkItems(startDay: dayString, endDay: dayString) { array in
            self.workItems = array
        }
    }
}