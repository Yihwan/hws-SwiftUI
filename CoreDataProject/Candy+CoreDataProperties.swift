//
//  Candy+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Yihwan Kim on 11/28/19.
//  Copyright © 2019 Yihwan Kim. All rights reserved.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?

    public var wrappedName: String {
        name ?? "Unknown Candy"
    }

}
