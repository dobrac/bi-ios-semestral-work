//
//  TokenController.swift
//  ESTIMAS-SwiftUI
//
//  Created by Jakub Dobry on 07/02/2020.
//  Copyright © 2020 Jakub Dobry. All rights reserved.
//

import Foundation
import CoreData
import UIKit

func clearToken() {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
        return
    }

    let context = appDelegate.persistentContainer.viewContext

    let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "LoginToken")
    let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)

    do {
        try context.execute(deleteRequest)
        try context.save()
    } catch {
        print ("There was an error")
    }
}

func saveToken(token: Token) {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
        return
    }

    let moc = appDelegate.persistentContainer.viewContext

    clearToken()

    let loginToken = LoginToken(context: moc)
    loginToken.token = token.token
    loginToken.email = token.email
    loginToken.uid = token.uid
    try! moc.save()
}

func getToken() -> Token? {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
        return nil
    }

    let managedContext = appDelegate.persistentContainer.viewContext

    let fetchRequest: NSFetchRequest<LoginToken> = LoginToken.fetchRequest()

    do {
        let result = try managedContext.fetch(fetchRequest)
        let resultItem = result.first

        if let resultItem = resultItem {
            return Token(token: resultItem.token!, email: resultItem.email!, uid: resultItem.uid!)
        }
    } catch let error {
        print("Could not fetch. \(error)")
    }

    return nil
}

func getBasicHeaders() -> Dictionary<String, String> {
    let tokenGet = getToken()
    guard let token = tokenGet else {
        return [:]
    }

    let headers = [ "Authorization": "Bearer \(token.token)",
        "Accept": "application/json",
        "Content-Type": "application/json"]

    return headers
}
