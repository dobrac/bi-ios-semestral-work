//
//  User.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 09/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import Foundation

struct User: Decodable {
    var uid: String
    var fullName: String
    var email: String
}
