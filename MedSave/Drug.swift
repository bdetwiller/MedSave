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
    var options: [String: [String: [Int]]]
    var form: [String]
    var quantity: [Int]
    var dosage: [String]
    
    init(name: String, generic: String) {
        self.drugName = name
        self.genericName = generic
        self.options = [
            "Tablet": [
            "t10 mg": [30, 60, 90, 120, 180],
            "t20 mg": [30, 60, 90, 120, 180],
            "t40 mg": [30, 60, 90, 120, 180],
            "t80 mg": [30, 60, 90, 120, 180],
            ],
            "Capsule": [
            "c10 mg": [30, 60, 90, 120, 180],
            "c20 mg": [30, 60, 90, 120, 180],
            "c40 mg": [30, 60, 90, 120, 180],
            "c80 mg": [30, 60, 90, 120, 180],
            ],
        ]
        self.form = ["Tablet", "Capsule"]
        
        // TODO: Should add in label for dose and quantitiy. Maybe dict of options and each with own object ?
        self.quantity = [30, 60, 90, 120, 180]
        self.dosage = ["10 mg", "20 mg", "40 mg", "80 mg"]
    }
    
    init(name: String, generic: String, option: [String: [String: [Int]]]) {
        self.drugName = name
        self.genericName = generic
        self.options = option
        
        self.form = Array(self.options.keys)
        self.dosage = Array(self.options[self.form[0]]!.keys)
        self.quantity = Array(self.options[self.form[0]]![self.dosage[0]]!)
        
    }
    
    func getForms() -> [String] {
        return Array(self.options.keys)
    }
    
    func getDosages(form: String) -> [String] {
        return Array(self.options[form]!.keys)
    }
    
    func getQuantities(form: String, dosage: String) -> [Int] {
        return Array(self.options[form]![dosage]!)
    }
}

//object should probably have function so we can apply lables etc. 