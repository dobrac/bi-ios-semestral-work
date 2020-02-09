//
//  StatsController.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 09/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import Foundation
import Alamofire

func getTableStats(_ completion: @escaping ((TableStats?)->())) {
    let tokenGet = getToken()
    guard let token = tokenGet else {
        return
    }

    Alamofire.request("\(serverURL)/workReport/getUserReport6",
        method: .post,
        parameters: ["uidUser": token.uid],
        encoding: JSONEncoding.default,
        headers: getBasicHeaders())
        .response { response in
            guard let data = response.data else {
                print("FETCH ERROR: TableStats")
                completion(nil);
                return
            }

            do {
                let result = try JSONDecoder().decode(TableStats.self, from: data)
                completion(result)
            } catch {
                print("FETCH ERROR: TableStats")
                completion(nil)
            }
    }
}
