//
//  WorkItem.swift
//  ESTIMAS-SwiftUI
//
//  Created by Jakub Dobry on 07/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import Foundation

struct WorkItem: Decodable {
    var uid: String
    var startDate: String
    var endDate: String
    var note: String
    var activity: Activity
}
