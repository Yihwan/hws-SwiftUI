//
//  Movie+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Yihwan Kim on 11/28/19.
//  Copyright © 2019 Yihwan Kim. All rights reserved.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var director: String?
    @NSManaged public var year: Int16

    public var wrappedTitle: String {
        title ?? "Unknown Title"
    }
}
