//
//  apiRequest.swift
//  MedSave
//
//  Created by Robert Dunnette on 5/16/16.
//  Copyright © 2016 Bryant Detwiller. All rights reserved.
//

import UIKit
import Alamofire

class apiRequest {
    var baseUrl: String

    init () {
        self.baseUrl = "http://pharmacyio-data.herokuapp.com/d/"
    }
    
    func queryEndpoint(endpoint: String, completion: ([String: AnyObject]?,NSError?)->Void) {
        Alamofire.request(.GET, self.baseUrl + endpoint)
            .responseJSON { response in
                if let error = response.result.error {
                    print("error")
                    completion(nil,error)
                }
                else {
                    print("success")
                    completion(response.result.value as? [String: AnyObject],nil)
                }
        }
    }

}
