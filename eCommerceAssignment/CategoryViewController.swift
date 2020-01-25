//
//  CategoryViewController.swift
//  eCommerceAssignment
//
//  Created by Guest User on 26/01/20.
//  Copyright © 2020 Firoz Khan. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var categories = [] as [Category]
    
    var predicate = NSPredicate()
    
    @IBOutlet weak private var categoryTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        categories = AppResourceManager.sharedAppResourceManager.findAllCategories(sortedBy: "name", ascending: true, withPredicate: predicate)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    private func pushViewController(withIdentifier identifier:String, categoryID:Int64, title:String, hasProducts: Bool){
        let viewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: identifier)
        viewController.title = title
        
        if !hasProducts, let categoryViewController = viewController as? CategoryViewController{
            categoryViewController.predicate = NSPredicate(format: "parentCategory.id=%dl",categoryID) as NSPredicate
        }
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    
//    MARK: UITableViewCell DataSource Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return categories.count
        }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        let category = categories[indexPath.row]

        if( !(cell != nil))
        {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
            cell!.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        }
        
        cell!.textLabel?.text = category.name
        
        return cell!
    }

//    MARK: TableViewCell Delegate Methods
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            let category = categories[indexPath.row]
            
            let hasProducts = (category.products!.count>0)
            let vcTitle = category.name
            let vcIdentifier = hasProducts ? "ProductViewController" : "CategoryViewController"
            
            pushViewController(withIdentifier: vcIdentifier, categoryID: category.id, title: vcTitle!, hasProducts: hasProducts)
        }
                
//    MARK: Utility Functions
}
