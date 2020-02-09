//
//  WorkItem.swift
//  ESTIMAS-SwiftUI
//
//  Created by Jakub Dobry on 07/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import Foundation

struct WorkItem: Decodable, Identifiable {
    var id: String {
        get { uid }
    }
    var uid: String
    var startDate: String
    var endDate: String
    var note: String
    var activity: Activity

    func getStartDate() -> Date {
        return mainDateFormat.date(from: startDate)! // can't be null if there is no data error
    }

    func getEndDate() -> Date? {
        if (endDate == emptyDate) { return nil }
        return mainDateFormat.date(from: endDate)! // can't be null if there is no data error
    }

    func getTimeElapsed(from: Date) -> Double {
        let startDate = getStartDate()
        let endInterval = getEndDate()?.timeIntervalSince1970 ?? from.timeIntervalSince1970 - Double(TimeZone.current.secondsFromGMT())

        return endInterval - startDate.timeIntervalSince1970
    }
}
