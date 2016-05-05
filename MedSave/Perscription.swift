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
    var price: String
    var selectedPharmacy: Pharmacy
    
    init(drug: Drug, selectedPharmacy: Pharmacy) {
        self.drug = drug
        self.selectedPharmacy = selectedPharmacy
        
        // TODO: Need to program these depending on how drug object looks
        self.form = "Tablet"
        self.quantity = "20"
        self.dosage = "10 mg"
        self.price = "$5.00"
    }
}
