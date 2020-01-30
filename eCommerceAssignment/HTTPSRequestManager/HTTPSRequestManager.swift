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
    
    static let dataURL = "https://stark-spire-93433.herokuapp.com/json"
    
    public func sharedInstance()-> HTTPSRequestManager{
        return HTTPSRequestManager.sharedHTTPSRequestManager
    }
    
    public func getDataResponse(forURL url:URL){
        
    }
}
