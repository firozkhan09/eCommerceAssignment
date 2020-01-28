//
//  Product+CoreDataProperties.swift
//  eCommerceAssignment
//
//  Created by Guest User on 28/01/20.
//  Copyright © 2020 Firoz Khan. All rights reserved.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var dateAdded: Date?
    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var orderedCount: Int64
    @NSManaged public var sharedCount: Int64
    @NSManaged public var tax: NSObject?
    @NSManaged public var viewedCount: Int64
    @NSManaged public var category: Category?
    @NSManaged public var variants: NSSet?

}

// MARK: Generated accessors for variants
extension Product {

    @objc(addVariantsObject:)
    @NSManaged public func addToVariants(_ value: Variant)

    @objc(removeVariantsObject:)
    @NSManaged public func removeFromVariants(_ value: Variant)

    @objc(addVariants:)
    @NSManaged public func addToVariants(_ values: NSSet)

    @objc(removeVariants:)
    @NSManaged public func removeFromVariants(_ values: NSSet)

}
