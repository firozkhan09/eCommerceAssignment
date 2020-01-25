//
//  ViewController.swift
//  eCommerceAssignment
//
//  Created by Guest User on 18/01/20.
//  Copyright © 2020 Firoz Khan. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var menuItems = ["Category", "Ranking"]
    
    @IBOutlet weak private var homeTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Menu"
        
        //Setup initial Data
        AppResourceManager.sharedAppResourceManager.setupInitialApplicationData()
        
    }

//    MARK: TableViewCell Datasource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        let menuItem = menuItems[indexPath.row]

        if( !(cell != nil))
        {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
            cell!.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        }
        
        cell!.textLabel?.text = menuItem
        
        return cell!
    }

//    MARK: TableViewCell Delegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let title = menuItems[indexPath.row]
        let identifier = (title=="Category") ? "CategoryViewController" : "RankingViewController"
        pushViewController(withIdentifier: identifier, title: title)
    }
    
    
//    MARK: Utility Functions
    private func pushViewController(withIdentifier identifier:String, title:String){
        let viewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: identifier)
        viewController.title = title
        
        if title=="Category", let categoryViewController = viewController as? CategoryViewController{
            categoryViewController.predicate = NSPredicate(format: "parentCategory=nil") as NSPredicate
        }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

