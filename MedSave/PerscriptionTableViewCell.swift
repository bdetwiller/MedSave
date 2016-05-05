//
//  PerscriptionTableViewCell.swift
//  MedSave
//
//  Created by Bryant Detwiller on 5/5/16.
//  Copyright © 2016 Bryant Detwiller. All rights reserved.
//

import UIKit

class PerscriptionTableViewCell: UITableViewCell {

    @IBOutlet weak var drugNameLabel: UILabel!
    @IBOutlet weak var perscriptionDetailsLabel: UILabel!
    @IBOutlet weak var pharmacyLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
