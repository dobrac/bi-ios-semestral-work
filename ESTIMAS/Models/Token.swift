//
//  Token.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 06/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import Foundation

struct Token: Decodable {
    var token: String
    var email: String
    var uid: String
}
