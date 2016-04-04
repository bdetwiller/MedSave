//
//  DrugDetailsTableViewCell.swift
//  MedSave
//
//  Created by Bryant Detwiller on 4/4/16.
//  Copyright © 2016 Bryant Detwiller. All rights reserved.
//

import UIKit

class DrugDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var fieldLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
