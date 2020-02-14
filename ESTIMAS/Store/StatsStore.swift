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
    @Published var state: FETCH_STATE = .loading

    init() {
    }

    func fetchStats(_ completion: @escaping () -> Void = {}) {
        state = .loading

        getTableStats({
            self.state = .error
            completion()
        }) { tableStats in
            self.tableStats = tableStats
            self.state = .success
            completion()
        }
    }
}
