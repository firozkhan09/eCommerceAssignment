//
//  Category+CoreDataProperties.swift
//  eCommerceAssignment
//
//  Created by Guest User on 21/01/20.
//  Copyright © 2020 Firoz Khan. All rights reserved.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String
    @NSManaged public var subCategories: NSSet?

}

// MARK: Generated accessors for subCategories
extension Category {

    @objc(addSubCategoriesObject:)
    @NSManaged public func addToSubCategories(_ value: SubCategory)

    @objc(removeSubCategoriesObject:)
    @NSManaged public func removeFromSubCategories(_ value: SubCategory)

    @objc(addSubCategories:)
    @NSManaged public func addToSubCategories(_ values: NSSet)

    @objc(removeSubCategories:)
    @NSManaged public func removeFromSubCategories(_ values: NSSet)

}
