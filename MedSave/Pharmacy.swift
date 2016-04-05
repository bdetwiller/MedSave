//
//  Pharmacy.swift
//  MedSave
//
//  Created by Bryant Detwiller on 4/5/16.
//  Copyright © 2016 Bryant Detwiller. All rights reserved.
//

import UIKit

class Pharmacy: NSObject {
    var name: String
    var address: String
    var phone: String

    init(name: String, address: String) {
        self.name = name
        self.address = address
        self.phone = "555-555-555"
    }
}
