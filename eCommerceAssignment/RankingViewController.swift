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
}
