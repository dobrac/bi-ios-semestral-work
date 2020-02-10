//
//  BaseController.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 06/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import Foundation

public var companyName: String = "beta"
public var serverURL: String = "https://v11.server.estimas.cz/api"

public var emptyDate: String = "0001-01-01T00:00:00"

public var mainDateFormat: DateFormatter {
    get {
        let format = DateFormatter()
        format.timeZone = TimeZone(identifier: "UTC")
        format.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss"
        return format
    }
}

public var humanTime: DateFormatter {
    get {
        let format = DateFormatter()
        format.dateFormat = "HH':'mm':'ss"
        return format
    }
}


