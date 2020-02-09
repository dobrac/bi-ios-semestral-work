//
//  Activity.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 06/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import Foundation
import SwiftUI

struct ProjectActivity: Decodable, Identifiable {
    var id: String {
        get { project.uid }
    }
    var project: Project
    var activities: [Activity]
}

struct Project: Decodable, Identifiable {
    var id: String {
        get { uid }
    }
    var uid: String
    var name: String
    var color: String
    var isWithoutProject: Bool
}

struct Activity: Decodable, Identifiable {
    var id: String {
        get { uid }
    }
    var uid: String
    var name: String
    var project: Project

    var color: Color {
        get {
            return Color(hexStringToUIColor(hex: project.color))
        }
    }
}
