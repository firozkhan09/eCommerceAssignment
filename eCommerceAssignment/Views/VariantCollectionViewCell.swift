//
//  VariantCollectionViewCell.swift
//  eCommerceAssignment
//
//  Created by Guest User on 30/01/20.
//  Copyright © 2020 Firoz Khan. All rights reserved.
//

import UIKit

class VariantCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak private var priceLabel: UILabel!
    
    @IBOutlet weak private var sizeLabel: UILabel!
    
    @IBOutlet weak private var colorLabel: UILabel!
    
    @IBOutlet weak private var colorView: UIView!
    
    public func setupCollectionViewCell(forVariant variant : Variant){
        priceLabel.text = variant.price.description
        sizeLabel.text = variant.size.description
        colorLabel.text = variant.color
        colorView.backgroundColor = color(forColorName: variant.color!)
    }
    
    private func color(forColorName colorName : String)->UIColor{
        switch colorName {
        case "Black":
            return UIColor.black
        case "Blue":
            return UIColor.blue
        case "Red":
            return UIColor.red
        case "Green":
            return UIColor.green
        case "Brown":
            return UIColor.brown
        case "Grey":
            return UIColor.gray
        case "Cyan":
            return UIColor.cyan
        case "Yellow":
            return UIColor.yellow
        case "Magenta":
            return UIColor.magenta
        case "Orange":
            return UIColor.orange
        case "Purple":
            return UIColor.purple
        case "Golden":
            return UIColor(displayP3Red: 212/256, green: 175/256, blue: 55/256, alpha: 1.0)
        case "Silver":
            let rgb = 192/256 as CGFloat
            return UIColor(displayP3Red: rgb, green: rgb, blue: rgb, alpha: 1.0)
        default:
            return UIColor.white
        }
    }
}
