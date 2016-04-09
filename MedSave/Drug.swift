//
//  Drug.swift
//  MedSave
//
//  Created by Bryant Detwiller on 4/2/16.
//  Copyright © 2016 Bryant Detwiller. All rights reserved.
//

import UIKit

class Drug {
    var drugName: String
    var genericName: String
    var form: [String]
    var quantity: [Int]
    var dosage: [String]
    
    init(name: String, generic: String) {
        self.drugName = name
        self.genericName = generic
        self.form = ["Tablet", "Capsule"]
        
        //Should add in label for dose and quantitiy. Maybe dict of options and each with own object ?
        self.quantity = [30, 60, 90, 120, 180]
        self.dosage = ["10 mg", "20 mg", "40 mg", "80 mg"]
        
    }
}

//object should probably have function so we can apply lables etc. 