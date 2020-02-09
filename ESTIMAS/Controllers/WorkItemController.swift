//
//  TimerController.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 07/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import Foundation
import Alamofire

func getLastWorkItem(_ completion: @escaping ((WorkItem?)->())) {
    Alamofire.request("\(serverURL)/WorkItem/getLast",
        method: .get,
        encoding: JSONEncoding.default,
        headers: getBasicHeaders())
        .response { response in
            guard let data = response.data else {
                print("FETCH ERROR")
                completion(nil);
                return
            }

            do {
                let result = try JSONDecoder().decode(WorkItem.self, from: data)
                if result.endDate == emptyDate {
                    completion(result)
                    return
                }
            } catch {
                print("FETCH ERROR")
            }
            completion(nil)
    }
}

func startTask(activity: Activity, _ completion: @escaping ()->()) {
    Alamofire.request("\(serverURL)/WorkItem/startWorking",
        method: .post,
        parameters: ["uidActivity": activity.uid, "billed": true],
        encoding: JSONEncoding.default,
        headers: getBasicHeaders())
        .response { _ in
            completion()
        }
}

func endLastTask(_ completion: @escaping ()->()) {
    let tokenGet = getToken()
    guard let token = tokenGet else {
        return
    }

    Alamofire.request("\(serverURL)/WorkItem/endWorkUID/\(token.uid)",
        method: .get,
        headers: getBasicHeaders())
        .response { _ in
            completion()
        }
}

func getWorkItems(startDay: String, endDay: String, _ completion: @escaping ([WorkItem])->()) {
    let tokenGet = getToken()
    guard let token = tokenGet else {
        return
    }

    Alamofire.request("\(serverURL)/WorkItem/getForUserInterval/\(startDay)/\(endDay)/\(token.uid)",
        method: .get,
        headers: getBasicHeaders())
        .response { response in
            guard let data = response.data else {
                print("FETCH ERROR")
                completion([]);
                return
            }

            do {
                let result = try JSONDecoder().decode([WorkItem].self, from: data)
                completion(result.reversed())
            } catch {
                print("FETCH ERROR")
                completion([])
            }
    }
}
