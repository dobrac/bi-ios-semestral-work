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
    @Published var loading: Bool = false
    @Published var error: Bool = false

    init() {
    }

    func fetchStats() {
        self.loading = true
        self.error = false
        
        getTableStats({
            self.error = true
            self.loading = false
        }) { tableStats in
            self.tableStats = tableStats
            self.loading = false
        }
    }
}
