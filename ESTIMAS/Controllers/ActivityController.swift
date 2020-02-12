//
//  ActivityController.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 06/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import Foundation
import Alamofire

func getProjectActivitiesGrouped(_ error: @escaping () -> (),_ completion: @escaping (([ProjectActivity])->())) {
    let tokenGet = getToken()
    guard let token = tokenGet else {
        error()
        return
    }

    Alamofire.request("\(serverURL)/activity/getForUserGrouped",
        method: .post,
        parameters: ["uid": token.uid],
        encoding: JSONEncoding.default,
        headers: getBasicHeaders())
        .response { response in
            guard let data = response.data else {
                print("getProjectActivitiesGrouped: FETCH ERROR")
                error()
                return
            }

            do {
                let result = try JSONDecoder().decode([ProjectActivity].self, from: data)
                completion(result)
                return
            } catch {
                print("getProjectActivitiesGrouped: FETCH ERROR")
            }
            error()
    }
}
