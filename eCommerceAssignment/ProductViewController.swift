//
//  ProductViewController.swift
//  eCommerceAssignment
//
//  Created by Guest User on 26/01/20.
//  Copyright © 2020 Firoz Khan. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var productList = [] as [Product]
    
    var predicate : NSPredicate? = nil
    
    var sortBy  = "orderedCount" as String
    
    var isGroupedByRank = false
    
    @IBOutlet weak private var productTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Setup Navigatin bar Button
        if !isGroupedByRank {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sort", style: .plain, target: self, action: #selector(sortBarButtonTapped(sender:)))
        }

        
        //Find Product informations
        productList = AppResourceManager.sharedAppResourceManager.findAllProducts(sortedBy: sortBy, ascending: false, withPredicate: predicate)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
//    MARK: Navigation BarButton Actions
    @objc private func sortBarButtonTapped(sender:UIBarButtonItem){
        //Create the AlertController and add Its action like button in Actionsheet
        let actionSheetControllerIOS8: UIAlertController = UIAlertController(title: "Sort by:", message: nil, preferredStyle: .actionSheet)

        let mostOrderedActionButton = UIAlertAction(title: "Most Ordered", style: .default) { _ in
            self.sortAndUpdateTableView(forProducts: self.productList, by: "orderedCount", ascending: false)
        }
        actionSheetControllerIOS8.addAction(mostOrderedActionButton)

        let mostSharedActionButton = UIAlertAction(title: "Most Shared", style: .default)
            { _ in
               self.sortAndUpdateTableView(forProducts: self.productList, by: "sharedCount", ascending: false)
        }
        actionSheetControllerIOS8.addAction(mostSharedActionButton)

        let mostViewedActionButton = UIAlertAction(title: "Most Viewed", style: .default)
            { _ in
                self.sortAndUpdateTableView(forProducts: self.productList, by: "viewedCount", ascending: false)
        }
        actionSheetControllerIOS8.addAction(mostViewedActionButton)
        
        let cancelActionButton = UIAlertAction(title: "CANCEL", style: .cancel) { _ in
            print("Sorting Cancel")
        }
        actionSheetControllerIOS8.addAction(cancelActionButton)
        
        self.present(actionSheetControllerIOS8, animated: true, completion: nil)
    }
    
        
//    MARK: UITableViewCell DataSource Methods
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return productList.count
        }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        let product = productList[indexPath.row]

        if( !(cell != nil))
        {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
            cell!.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        }
        
        cell!.textLabel?.text = product.name
        cell?.detailTextLabel?.text = getProductDescription(forProduct: product, ofSortProperty: sortBy)
        
        return cell!
    }


//    MARK: Utility Functions
    
    private func sortAndUpdateTableView(forProducts products:[Product], by:String, ascending:Bool){
        sortBy = by
        
        switch by {
        case "orderedCount":
            productList = ascending ? products.sorted(by: {$0.orderedCount < $1.orderedCount}) : products.sorted(by: {$0.orderedCount > $1.orderedCount})
        case "viewedCount":
            productList = ascending ? products.sorted(by: {$0.viewedCount < $1.viewedCount}) : products.sorted(by: {$0.viewedCount > $1.viewedCount})
        case "sharedCount":
            productList = ascending ? products.sorted(by: {$0.sharedCount < $1.sharedCount}) : products.sorted(by: {$0.sharedCount > $1.sharedCount})
        default:
            print("No Change")
        }
        productTableView.reloadData()
    }

    private func getProductDescription(forProduct product: Product, ofSortProperty sortProperty:String)->String{
        var productDescription : String? = ""
        
        switch sortProperty {
        case "orderedCount":
            productDescription = String(format: "Ordered Count : %ld", product.orderedCount) as String
        case "viewedCount":
            productDescription = String(format: "Viewed Count : %ld", product.viewedCount)
        case "sharedCount":
            productDescription = String(format: "Shared Count : %ld", product.sharedCount)
        default:
            return productDescription!
        }
        return productDescription!
    }
}
