//
//  Perscription.swift
//  MedSave
//
//  Created by Bryant Detwiller on 4/9/16.
//  Copyright © 2016 Bryant Detwiller. All rights reserved.
//

import UIKit

class Perscription: NSObject {
    var drug: Drug
    var form: String
    var quantity: String
    var dosage: String
    var price: String?
    var selectedPharmacy: Pharmacy?
    var priceData = [[String: AnyObject]]()
    
    init(drug: Drug, form: String, quantity: String, dosage: String) {
        self.drug = drug
        
        // TODO: Add objects or enums for each
        self.form = form
        self.quantity = quantity
        self.dosage = dosage
        
        // TODO: Make this calculated
    }
    
    func getPriceData(ncdp: String, ndc: String, quantity: String) {
        let endpointUrl = "prices?ncdp_list=" + ncdp + "&ndc=" + ndc +  "&quantity=" + quantity
        let apiReq = apiRequest()
        apiReq.queryEndpoint(endpointUrl, completion:  {(data,error) in
            if let data = data?["result"] as? [[String:AnyObject]] {
                self.priceData = data
            }
        })
    }

    //TODO: should this have some helper functions?
}
