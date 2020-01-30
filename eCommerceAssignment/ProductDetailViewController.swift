//
//  ProductDetailViewController.swift
//  eCommerceAssignment
//
//  Created by Guest User on 26/01/20.
//  Copyright © 2020 Firoz Khan. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    
    var product = Product()
    
    var variants = [] as [Variant]

    @IBOutlet weak private var nameLabel: UILabel!
    
    @IBOutlet weak private var dateLabel: UILabel!
    
    @IBOutlet weak private var taxLabel: UILabel!
    
    @IBOutlet weak private var viewCountLabel: UILabel!
    
    @IBOutlet weak private var orderCountLabel: UILabel!
    
    @IBOutlet weak private var shareCountLabel: UILabel!
    
    @IBOutlet weak private var variantCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupProductView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if product.variants!.count>0 {
            variants = product.variants?.allObjects as! [Variant]
            variantCollectionView.reloadData()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
//    MARK: View Setup Function
    private func setupProductView(){
        nameLabel.text = product.name
        dateLabel.text = getDateString(forDate: product.dateAdded)
        taxLabel.text = getTaxDetailString(forProductTax: product.tax as! [String:Any])
        viewCountLabel.text = product.viewedCount.description
        shareCountLabel.text = product.sharedCount.description
        orderCountLabel.text = product.orderedCount.description
    }
    
    public func getDateString(forDate date:Date?)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy MMMM, dd"
        let dateStr = dateFormatter.string(from: date!)
        return dateStr
    }
    
    private func getTaxDetailString(forProductTax tax:[String:Any])->String{
//        let value = tax["value"] as! Int16
        let name = tax["name"] as! String
//        return NSString(format: "%@ %@", value.description, name)
        return name
    }
    
//    MARK: CollectionView DataSource Functions
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return variants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VariantCollectionViewCell", for: indexPath) as! VariantCollectionViewCell
        cell.setupCollectionViewCell(forVariant: variants[indexPath.row])
        return cell
    }
}
