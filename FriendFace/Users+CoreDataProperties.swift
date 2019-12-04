//
//  Users+CoreDataProperties.swift
//  FriendFace
//
//  Created by Yihwan Kim on 11/28/19.
//  Copyright © 2019 Yihwan Kim. All rights reserved.
//
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: String?
    @NSManaged public var age: Int16

}
