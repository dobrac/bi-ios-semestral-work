//
//  LoginToken+CoreDataProperties.swift
//  
//
//  Created by Jakub Dobry on 06/02/2020.
//
//

import Foundation
import CoreData


extension LoginToken {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LoginToken> {
        return NSFetchRequest<LoginToken>(entityName: "LoginToken")
    }

    @NSManaged public var token: String?

}
