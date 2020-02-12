//
//  UserController.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 09/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import Foundation
import Alamofire

func getUser(_ error: @escaping () -> (),_ completion: @escaping ((User?)->())) {
    let tokenGet = getToken()
    guard let token = tokenGet else {
        error()
        return
    }

    Alamofire.request("\(serverURL)/user/getUserLite/\(token.uid)",
        method: .get,
        encoding: JSONEncoding.default,
        headers: getBasicHeaders())
        .response { response in
            guard let data = response.data else {
                print("getUser: FETCH ERROR")
                error()
                return
            }

            do {
                let result = try JSONDecoder().decode(User.self, from: data)
                completion(result)
                return
            } catch {
                print("getUser: FETCH ERROR")
            }
            error()
    }
}

func getProfilePicture(_ error: @escaping () -> (),_ completion: @escaping ((String?)->())) {
    let tokenGet = getToken()
    guard let token = tokenGet else {
        error()
        return
    }

    Alamofire.request("\(serverURL)/profilePicture/getPicture/\(token.uid)",
        method: .get,
        headers: getBasicHeaders())
        .response { response in
            guard let data = response.data else {
                print("getProfilePicture: FETCH ERROR")
                error()
                return
            }

            let base64 = String.init(data: data, encoding: .utf8)
            completion(base64)
    }
}

func setProfilePicture(image: String, _ completion: @escaping ()->()) {
    let tokenGet = getToken()
    guard let token = tokenGet else {
        return
    }
    
    Alamofire.request("\(serverURL)/profilePicture/setPicture",
        method: .post,
        parameters: ["uidUser": token.uid, "basePicture": image],
        encoding: JSONEncoding.default,
        headers: getBasicHeaders())
        .response { _ in
            completion()
    }
}
