//
//  Stats.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 09/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import Foundation

struct TableStats: Decodable {
    var billedTimeToday: Int
    var billedTimeYesterday: Int

    var billedTimeThisWeek: Int
    var billedTimeLastWeek: Int

    var billedTimeThisMonth: Int
    var billedTimeLastMonth: Int
}
