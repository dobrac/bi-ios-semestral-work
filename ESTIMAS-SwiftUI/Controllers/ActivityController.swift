//
//  ActivityController.swift
//  ESTIMAS-SwiftUI
//
//  Created by Jakub Dobry on 06/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import Foundation
import Alamofire

func getProjectActivitiesGrouped(_ completion: @escaping (([ProjectActivity])->())) {
    let tokenGet = getToken()
    guard let token = tokenGet else {
        completion([])
        return
    }

    Alamofire.request("\(serverURL)/activity/getForUserGrouped",
        method: .post,
        parameters: ["uid": token.uid],
        encoding: JSONEncoding.default,
        headers: getBasicHeaders())
        .response { response in
            guard let data = response.data else {
                print("FETCH ERROR")
                completion([]);
                return
            }

            do {
                let result = try JSONDecoder().decode([ProjectActivity].self, from: data)
                completion(result)
            } catch {
                print("FETCH ERROR")
                completion([])
            }
    }
}
