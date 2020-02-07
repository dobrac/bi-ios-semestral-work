//
//  LoginController.swift
//  ESTIMAS-SwiftUI
//
//  Created by Jakub Dobry on 06/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import Foundation
import Alamofire


func loginUser(username: String, password: String, _ completion: @escaping ((Token?)->())) {
    Alamofire.request("\(serverURL)/token",
        method: .post,
        parameters: ["email": username, "password": password, "domain": companyName, "expirationType": 2],
        encoding: JSONEncoding.default,
        headers: nil)
        .response { response in
            guard let data = response.data else {
                completion(nil);
                return
            }

            do {
                let result = try JSONDecoder().decode(Token.self, from: data)
                completion(result)
            } catch {
                completion(nil)
            }
    }
}
