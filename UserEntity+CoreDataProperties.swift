//
//  UserEntity+CoreDataProperties.swift
//  CoreDataBAZExample
//
//  Created by Benny Reyes on 26/04/23.
//
//

import Foundation
import CoreData


extension UserEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserEntity> {
        return NSFetchRequest<UserEntity>(entityName: "UserEntity")
    }

    @NSManaged public var name: String!
    @NSManaged public var phone: String!
    @NSManaged public var edad: Int16
    @NSManaged public var email: String!

}

extension UserEntity : Identifiable {

}
