//
//  SubCategory+CoreDataProperties.swift
//  eCommerceAssignment
//
//  Created by Guest User on 21/01/20.
//  Copyright © 2020 Firoz Khan. All rights reserved.
//
//

import Foundation
import CoreData


extension SubCategory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SubCategory> {
        return NSFetchRequest<SubCategory>(entityName: "SubCategory")
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String
    @NSManaged public var products: NSSet?

}

// MARK: Generated accessors for products
extension SubCategory {

    @objc(addProductsObject:)
    @NSManaged public func addToProducts(_ value: Product)

    @objc(removeProductsObject:)
    @NSManaged public func removeFromProducts(_ value: Product)

    @objc(addProducts:)
    @NSManaged public func addToProducts(_ values: NSSet)

    @objc(removeProducts:)
    @NSManaged public func removeFromProducts(_ values: NSSet)

}
