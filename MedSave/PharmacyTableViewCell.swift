//
//  PharmacyTableViewCell.swift
//  MedSave
//
//  Created by Bryant Detwiller on 4/5/16.
//  Copyright © 2016 Bryant Detwiller. All rights reserved.
//

import UIKit

class PharmacyTableViewCell: UITableViewCell {


    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var pharmacyNameLabel: UILabel!
    @IBOutlet weak var pharmacyAddressLabel: UILabel!
    @IBOutlet weak var pharmacyDistanceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
