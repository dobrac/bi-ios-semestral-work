//
//  UserController.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 09/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import Foundation
import Alamofire

func getUser(_ completion: @escaping ((User?)->())) {
    let tokenGet = getToken()
    guard let token = tokenGet else {
        return
    }

    Alamofire.request("\(serverURL)/user/getUserLite/\(token.uid)",
        method: .get,
        encoding: JSONEncoding.default,
        headers: getBasicHeaders())
        .response { response in
            guard let data = response.data else {
                print("FETCH ERROR: User")
                completion(nil);
                return
            }

            do {
                let result = try JSONDecoder().decode(User.self, from: data)
                completion(result)
            } catch {
                print("FETCH ERROR: User")
                completion(nil)
            }
    }
}

func getProfilePicture(_ completion: @escaping ((String?)->())) {
    let tokenGet = getToken()
    guard let token = tokenGet else {
        return
    }

    Alamofire.request("\(serverURL)/profilePicture/getPicture/\(token.uid)",
        method: .get,
        headers: getBasicHeaders())
        .response { response in
            guard let data = response.data else {
                print("FETCH ERROR: ProfilePicture")
                completion(nil);
                return
            }

            let base64 = String.init(data: data, encoding: .utf8)
            completion(base64)
    }
}
