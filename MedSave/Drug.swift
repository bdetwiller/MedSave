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
    //var form: [String]
    //var quantity: [Int]
    //var dosage: [String]
    
    init(name: String, generic: String) {
        self.drugName = name
        self.genericName = generic
        self.options = [
            "Tablet": [
            "t10 mg": [11, 12, 13, 14, 15],
            "t20 mg": [21, 22, 23, 24, 25],
            "t30 mg": [31, 32, 33, 34, 35],
            "t40 mg": [41, 42, 43, 44, 45],
            ],
            "Capsule": [
            "c10 mg": [1,11],
            "c20 mg": [2,22],
            "c30 mg": [3,33],
            "c40 mg": [4],
            ],
        ]
        //self.form = ["Tablet", "Capsule"]
        
        // TODO: Should add in label for dose and quantitiy. Maybe dict of options and each with own object ?
        //self.quantity = [30, 60, 90, 120, 180]
        //self.dosage = ["10 mg", "20 mg", "40 mg", "80 mg"]
    }
    
    init(name: String, generic: String, option: [String: [String: [Int]]]) {
        self.drugName = name
        self.genericName = generic
        self.options = option
        
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
    
    func getFirstForm() -> String {
        return getForms()[0]
    }
    
    func getFirstDosage() -> String {
        return getDosages(getFirstForm())[0]
    }
    
    func getFirstQuantity() -> Int {
        return getQuantities(getFirstForm(), dosage: getFirstDosage())[0]
    }
}

//object should probably have function so we can apply lables etc. 