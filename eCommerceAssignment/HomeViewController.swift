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

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        AppResourceManager.sharedAppResourceManager.setupInitialApplicationData()
        
    }


}

