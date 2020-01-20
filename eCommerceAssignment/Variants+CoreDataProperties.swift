//
//  Variants+CoreDataProperties.swift
//  eCommerceAssignment
//
//  Created by Guest User on 21/01/20.
//  Copyright © 2020 Firoz Khan. All rights reserved.
//
//

import Foundation
import CoreData


extension Variants {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Variants> {
        return NSFetchRequest<Variants>(entityName: "Variants")
    }

    @NSManaged public var id: Int64
    @NSManaged public var colour: String?
    @NSManaged public var size: Int16
    @NSManaged public var price: Int64

}
