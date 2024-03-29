//
//  Category+CoreDataProperties.swift
//  eCommerceAssignment
//
//  Created by Guest User on 28/01/20.
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
    @NSManaged public var name: String?
    @NSManaged public var childCategories: NSSet?
    @NSManaged public var parentCategory: Category?
    @NSManaged public var products: NSSet?

}

// MARK: Generated accessors for childCategories
extension Category {

    @objc(addChildCategoriesObject:)
    @NSManaged public func addToChildCategories(_ value: Category)

    @objc(removeChildCategoriesObject:)
    @NSManaged public func removeFromChildCategories(_ value: Category)

    @objc(addChildCategories:)
    @NSManaged public func addToChildCategories(_ values: NSSet)

    @objc(removeChildCategories:)
    @NSManaged public func removeFromChildCategories(_ values: NSSet)

}

// MARK: Generated accessors for products
extension Category {

    @objc(addProductsObject:)
    @NSManaged public func addToProducts(_ value: Product)

    @objc(removeProductsObject:)
    @NSManaged public func removeFromProducts(_ value: Product)

    @objc(addProducts:)
    @NSManaged public func addToProducts(_ values: NSSet)

    @objc(removeProducts:)
    @NSManaged public func removeFromProducts(_ values: NSSet)

}
