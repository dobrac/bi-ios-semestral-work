//
//  TimerController.swift
//  ESTIMAS
//
//  Created by Jakub Dobry on 07/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import Foundation
import Alamofire

func getLastWorkItem(_ error: @escaping () -> (),_ completion: @escaping ((WorkItem?)->())) {
    Alamofire.request("\(serverURL)/WorkItem/getLast",
        method: .get,
        encoding: JSONEncoding.default,
        headers: getBasicHeaders())
        .response { response in
            guard let data = response.data else {
                print("getLastWorkItem: FETCH ERROR")
                error()
                return
            }
            
            do {
                let result = try JSONDecoder().decode(WorkItem.self, from: data)
                if result.endDate == emptyDate {
                    completion(result)
                } else {
                    completion(nil)
                }
                return
            } catch {
                print("getLastWorkItem: FETCH ERROR")
            }
            error()
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

func getWorkItems(startDay: String, endDay: String, _ error: @escaping () -> (),_ completion: @escaping ([WorkItem])->()) {
    let tokenGet = getToken()
    guard let token = tokenGet else {
        error()
        return
    }
    
    Alamofire.request("\(serverURL)/WorkItem/getForUserInterval/\(startDay)/\(endDay)/\(token.uid)",
        method: .get,
        headers: getBasicHeaders())
        .response { response in
            guard let data = response.data else {
                print("getWorkItems: FETCH ERROR")
                error()
                return
            }
            
            do {
                let result = try JSONDecoder().decode([WorkItem].self, from: data)
                completion(result.reversed())
                return
            } catch {
                print("getWorkItems: FETCH ERROR")
            }
            error()
    }
}

func removeWorkItem(workItem: WorkItem, _ completion: @escaping ()->()) {
    Alamofire.request("\(serverURL)/WorkItem/removeWorkItem",
        method: .post,
        parameters: ["uid": workItem.uid, "reason": ""],
        encoding: JSONEncoding.default,
        headers: getBasicHeaders())
        .response { _ in
            completion()
    }
}

func editWorkItem(workItem: WorkItem, startDate: Date, endDate: Date, _ completion: @escaping ()->()) {
    let tokenGet = getToken()
    guard let token = tokenGet else {
        return
    }
    
    Alamofire.request("\(serverURL)/WorkItem/updateWorkItem",
        method: .post,
        parameters: [
            "uid": workItem.uid,
            "uidUser": token.uid,
            "uidActivity": workItem.activity.uid,
            "startDate": mainDateFormat.string(from: startDate),
            "endDate": mainDateFormat.string(from: endDate),
            "note": workItem.note,
            "billed": true,
            "reason": ""
        ],
        encoding: JSONEncoding.default,
        headers: getBasicHeaders())
        .response { _ in
            completion()
    }
}

