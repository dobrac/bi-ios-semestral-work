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

func secondsToString(seconds: Int) -> String {
    let (h, m, s) = secondsToHoursMinutesSeconds(seconds: seconds)

    return "\(getStringFrom(time: h)):\(getStringFrom(time: m)):\(getStringFrom(time: s))"
}

func secondsToString(seconds: Double) -> String {
    let (h, m, s) = secondsToHoursMinutesSeconds(seconds: seconds)

    return "\(getStringFrom(time: h)):\(getStringFrom(time: m)):\(getStringFrom(time: s))"
}

func formatWorked(seconds: Int?) -> String {
    guard let sec = seconds else {
        return "...";
    }
    let mTime = secondsToString(seconds: sec).split(separator: ":");
    let hours = Int(mTime[0])!;
    let minutes = Int(mTime[1])!;

    var toReturn = "";
    if (hours == 1) {
        toReturn += String(hours) + " hodina a "
    } else if (hours >= 2 && hours <= 4) {
        toReturn += String(hours) + " hodiny a "
    } else if (hours >= 5) {
        toReturn += String(hours) + " hodin a "
    }
    if (minutes == 1) {
        toReturn += String(minutes) + " minuta"
    } else if (minutes >= 2 && minutes <= 4) {
        toReturn += String(minutes) + " minuty"
    } else if (minutes >= 5 || minutes == 0) {
        toReturn += String(minutes) + " minut"
    }
    return toReturn
}
