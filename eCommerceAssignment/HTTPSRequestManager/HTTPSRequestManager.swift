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
    
    public func request(forURL url:URL, withCompletionHandler completionHandler:  @escaping (_ responseDict: NSDictionary?, _ error: Error?) -> Void){
        let task  = URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
            if (data != nil){
                do{
                    //Convert response data to JSON
                    let responseDataDict = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                    completionHandler(responseDataDict, error)
                } catch {
                    completionHandler(nil, error)
                }
            }else{
                completionHandler(nil, error)
            }
        }
        
        task.resume()
    }
}
