//
//  RankingViewController.swift
//  eCommerceAssignment
//
//  Created by Guest User on 26/01/20.
//  Copyright © 2020 Firoz Khan. All rights reserved.
//

import UIKit

class RankingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var rankings = [] as [Ranking]
    
    @IBOutlet weak private var rankingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        rankings = AppResourceManager.sharedAppResourceManager.findAllRankings(sortedBy: "rank", ascending: true, withPredicate: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

        
    //    MARK: UITableViewCell DataSource Methods
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return rankings.count
            }
            
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
            let ranking = rankings[indexPath.row]

            if( !(cell != nil))
            {
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
                cell!.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
            }
            
            cell!.textLabel?.text = ranking.rank
            
            return cell!
        }

//    MARK: TableViewCell Delegate Methods
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            let ranking = rankings[indexPath.row]
            let productViewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ProductViewController") as! ProductViewController
            productViewController.title = ranking.rank
            if let propertyName = getProductPropertyName(forRank: ranking.rank!) {
                let predicateStr = String(format: "%@ != 0", propertyName ) as String
                productViewController.predicate = NSPredicate(format: predicateStr ) as NSPredicate
                productViewController.sortBy = propertyName
                productViewController.isGroupedByRank = true
            }            
            
            self.navigationController?.pushViewController(productViewController, animated: true)
        }
                
//    MARK: Utility Functions
    
    private func getProductPropertyName(forRank rank:String)->String?{
        var propertyName : String? = nil
        
        switch rank {
        case "Most Viewed Products":
            propertyName = "viewedCount"
        case "Most OrdeRed Products":
            propertyName = "orderedCount"
        case "Most ShaRed Products":
            propertyName = "sharedCount"
        default:
            return nil
        }
        return propertyName
    }
}
