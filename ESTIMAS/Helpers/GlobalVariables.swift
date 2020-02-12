//
//  BaseController.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 06/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import Foundation
import SwiftUI

public var companyName: String = "beta"
public var serverURL: String = "https://v11.server.estimas.cz/api"

public var emptyDate: String = "0001-01-01T00:00:00"

public enum FETCH_STATE {
    case success, softLoading, hardLoading, error

    var isError: Bool {
        get { return self == .error}
        set {  }
    }

    var isLoading: Bool {
        get { return isSoftLoading || isHardLoading}
        set {  }
    }

    var isSoftLoading: Bool {
        get { return self == .softLoading}
        set {  }
    }

    var isHardLoading: Bool {
        get { return self == .hardLoading}
        set {  }
    }

    var isSuccess: Bool {
        get { return self == .success}
        set {  }
    }
}

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


