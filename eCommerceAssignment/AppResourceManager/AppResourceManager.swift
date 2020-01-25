//
//  AppResourceManager.swift
//  eCommerceAssignment
//
//  Created by Guest User on 24/01/20.
//  Copyright © 2020 Firoz Khan. All rights reserved.
//

import Foundation
import CoreData

class AppResourceManager: NSObject {
    
    static let sharedAppResourceManager = AppResourceManager()
    
// MARK: Setup Public Functions
    
    public func sharedInstance()-> AppResourceManager{
        return AppResourceManager.sharedAppResourceManager
    }
    
    public func setupInitialApplicationData(){
        if let initialDict = getJSONDataDictionary() as? NSDictionary, let categories = initialDict["categories"] as? [[String: Any]], let rankings = initialDict["rankings"] as? [[String: Any]] {
            //Add categories to DB
            insertCategories(forCategorysArray: categories)
            insertRankings(forRankings: rankings)
            
            //Save all mapped data to DB
            NSManagedObjectContext.mr_default().mr_saveToPersistentStoreAndWait()
        }
    }
    
    
//    MARK:Core Data Opertaion Public Functions
    
    public func findAllCategories(sortedBy: String, ascending:Bool, withPredicate predicate:NSPredicate?)->[Category]{
        
        let categories = ( predicate != nil) ?
                    Category.mr_findAllSorted(by: sortedBy, ascending: ascending, with: predicate) as! [Category] :
                    Category.mr_findAllSorted(by: sortedBy, ascending: ascending) as! [Category]
        
        return categories
    }
    
// MARK: Utility Functions
    private func getJSONDataDictionary()-> NSDictionary{
        if let path = Bundle.main.path(forResource: "InitialData", ofType: "json") {
            do {
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                  let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                  if let jsonResult = jsonResult as? NSDictionary{
                            // do stuff
                    return jsonResult
                  }
              } catch {
                   // handle error
              }
        }
        return NSDictionary()
    }
    
    private func insertCategories(forCategorysArray categories: [[String:Any]]){
        for eachCategory in categories {
            let categoryObject = Category.mr_findFirstOrCreate(byAttribute: "id", withValue: eachCategory["id"] as! Int64)
            
            if categoryObject.isInserted{
                categoryObject.name = (eachCategory["name"] as! String)
                
                let childCategoryIds = eachCategory["child_categories"] as? [NSNumber]
                if ((childCategoryIds?.count) != 0){
                    //Add Child Categories
                    let childCategorySet = findOrCreateChildCategorySet(forCategory: categoryObject, withChildCategoryIds: childCategoryIds!)
                    categoryObject.addToChildCategories(childCategorySet)
                }
                else{
                    let productSet = findOrCreateProductSet(forCategory: categoryObject, withProducts: eachCategory["products"] as! [[String : Any]])
                   categoryObject.addToProducts(productSet)
                }
            }
        }
    }
    
    
    private func insertRankings(forRankings rankings:[[String:Any]]){
        for eachRanking in rankings{
            let rankingObject = Ranking.mr_findFirstOrCreate(byAttribute: "rank", withValue: eachRanking["ranking"] as! String)
            
            if let productsByRanking = eachRanking["products"] as? [[String:Any]]{
                let productsArray = NSMutableArray()
                for eachProductByRanking in productsByRanking{
                    let productObject = Product.mr_findFirstOrCreate(byAttribute: "id", withValue: eachProductByRanking["id"] as! Int64)
                    switch eachRanking["ranking"] as! String {
                    case "Most Viewed Products":
                        productObject.viewedCount = eachProductByRanking["view_count"] as! Int64
                    case "Most OrdeRed Products":
                        productObject.orderedCount = eachProductByRanking["order_count"] as! Int64
                    case "Most ShaRed Products":
                        productObject.viewedCount = eachProductByRanking["shares"] as! Int64
                    default:
                        continue
                    }
                    //Add complet Product Object to array
                    productsArray.add(productObject)
                }
                rankingObject.addToProducts(NSSet(array: productsArray as! [Any]))
            }
        }
    }
    
    private func findOrCreateChildCategorySet(forCategory parentCategory: Category, withChildCategoryIds childIDs:[NSNumber])->NSSet{
        let childCategories = NSMutableArray()
        for childID in childIDs{
            let childCategoryObject = Category.mr_findFirstOrCreate(byAttribute: "id", withValue: childID)
            childCategoryObject.parentCategory = parentCategory
            childCategories.add(childCategoryObject)
        }
        return NSSet(array: childCategories as! [Any])
    }
    
    private func findOrCreateProductSet(forCategory category: Category, withProducts products:[[String:Any]])->NSSet{
        let productObjectArray = NSMutableArray()
        for product in products{
            let productObject = Product.mr_findFirstOrCreate(byAttribute: "id", withValue: product["id"] as! Int64)
            if productObject.isInserted{
                productObject.name = product["name"] as? String
                productObject.tax = product["tax"] as? NSObject
                productObject.category = category
                let variantSet = findOrCreateProductVariantSet(forVariants: product["variants"]! as! [[String : Any]])
                productObject.addToVarients(variantSet)
            }
            productObjectArray.add(productObject)
        }
        return NSSet(array: productObjectArray as! [Any])
    }
    
    private func findOrCreateProductVariantSet(forVariants variants: [[String:Any]])->NSSet{
        let verientObjectArray = NSMutableArray()
        for verient in variants{
            let variantObject = Variant.mr_findFirstOrCreate(byAttribute: "id", withValue: verient["id"] as! Int64)
            if variantObject.isInserted{
                variantObject.color = verient["color"] as? String
                variantObject.size = verient["size"] as? Int16 ?? 0
                variantObject.price = verient["price"] as? Int64 ?? 0
            }
            verientObjectArray.add(variantObject)
        }
        return NSSet(array: verientObjectArray as! [Any])
    }
}
