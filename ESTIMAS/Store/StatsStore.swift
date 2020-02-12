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
    @Published var state: FETCH_STATE = .hardLoading

    init() {
    }

    private func setupLoading() {
        if (state == .error) {
            state = .hardLoading
        } else {
            state = .softLoading
        }
    }

    func fetchStats() {
        setupLoading()

        getTableStats({
            self.state = .error
        }) { tableStats in
            self.tableStats = tableStats
            self.state = .success
        }
    }
}
