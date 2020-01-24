//
//  HTTPSRequestManager.swift
//  eCommerceAssignment
//
//  Created by Guest User on 24/01/20.
//  Copyright © 2020 Firoz Khan. All rights reserved.
//

import Foundation

class HTTPSRequestManager: NSObject {
    
    static let sharedHTTPSRequestManager = HTTPSRequestManager()
    
    public func sharedInstance()-> HTTPSRequestManager{
        return HTTPSRequestManager.sharedHTTPSRequestManager
    }
}
