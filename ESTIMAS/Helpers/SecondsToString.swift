//
//  SecondsToString.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 07/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import Foundation

func secondsToHoursMinutesSeconds (seconds : Double) -> (Int, Int, Int) {
    return secondsToHoursMinutesSeconds(seconds: Int(seconds))
}

func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
    return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
}

func getStringFrom(time: Int) -> String {
    return time < 10 ? "0\(time)" : "\(time)"
}

func secondsToString(seconds: Double) -> String {
    let (h, m, s) = secondsToHoursMinutesSeconds(seconds: seconds)

    return "\(getStringFrom(time: h)):\(getStringFrom(time: m)):\(getStringFrom(time: s))"
}
