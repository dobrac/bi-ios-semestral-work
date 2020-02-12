//
//  StatsController.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 09/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import Foundation
import Alamofire

func getTableStats(_ error: @escaping () -> (),_ completion: @escaping ((TableStats?)->())) {
    let tokenGet = getToken()
    guard let token = tokenGet else {
        error()
        return
    }

    Alamofire.request("\(serverURL)/workReport/getUserReport6",
        method: .post,
        parameters: ["uidUser": token.uid],
        encoding: JSONEncoding.default,
        headers: getBasicHeaders())
        .response { response in
            guard let data = response.data else {
                print("getTableStats: FETCH ERROR")
                error()
                return
            }

            do {
                let result = try JSONDecoder().decode(TableStats.self, from: data)
                completion(result)
                return
            } catch {
                print("getTableStats: FETCH ERROR")
            }
            error()
    }
}
