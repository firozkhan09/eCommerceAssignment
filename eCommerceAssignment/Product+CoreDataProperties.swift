//
//  Product+CoreDataProperties.swift
//  eCommerceAssignment
//
//  Created by Guest User on 21/01/20.
//  Copyright © 2020 Firoz Khan. All rights reserved.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String
    @NSManaged public var dateAdded: Date?
    @NSManaged public var tax: NSObject?
    @NSManaged public var orderedCount: Int64
    @NSManaged public var viewedCount: Int64
    @NSManaged public var sharedCount: Int64
    @NSManaged public var varients: NSSet?
    @NSManaged public var rankings: NSSet?

}

// MARK: Generated accessors for varients
extension Product {

    @objc(addVarientsObject:)
    @NSManaged public func addToVarients(_ value: Variants)

    @objc(removeVarientsObject:)
    @NSManaged public func removeFromVarients(_ value: Variants)

    @objc(addVarients:)
    @NSManaged public func addToVarients(_ values: NSSet)

    @objc(removeVarients:)
    @NSManaged public func removeFromVarients(_ values: NSSet)

}

// MARK: Generated accessors for rankings
extension Product {

    @objc(addRankingsObject:)
    @NSManaged public func addToRankings(_ value: Ranking)

    @objc(removeRankingsObject:)
    @NSManaged public func removeFromRankings(_ value: Ranking)

    @objc(addRankings:)
    @NSManaged public func addToRankings(_ values: NSSet)

    @objc(removeRankings:)
    @NSManaged public func removeFromRankings(_ values: NSSet)

}
