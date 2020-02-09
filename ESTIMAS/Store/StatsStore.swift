//
//  StatsStore.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 09/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import Foundation

class StatsStore : ObservableObject {
    @Published var tableStats: TableStats?

    init() {
    }

    func fetchStats() {
        getTableStats() { tableStats in
            self.tableStats = tableStats
        }
    }
}
