//
//  DrugDetailsViewController.swift
//  MedSave
//
//  Created by Bryant Detwiller on 3/31/16.
//  Copyright © 2016 Bryant Detwiller. All rights reserved.
//

import UIKit

class DrugDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var drugDetailsName: UILabel!
    @IBOutlet weak var drugDetailsGeneric: UILabel!
    
    var detailDrug: Drug!
    private var fields = ["Form", "Dosage", "Quantity", "Near"]
    private var cellIdentifier = "DrugDetailsCell"
    private var locationOptions = ["Current Location", "City or Zip Code"]
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drugDetailsName.text = detailDrug.drugName + " (generic)"
        drugDetailsGeneric.text = detailDrug.genericName
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: Table View Code
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fields.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! DrugDetailsTableViewCell
        
        let field = fields[indexPath.row]
        cell.fieldLabel.text = field
        
        // Set default info for cell valueLabel
        switch field {
            
        case "Form":
            cell.valueLabel.text = detailDrug.form[0]
            
        case "Dosage":
            cell.valueLabel.text = detailDrug.dosage[0]
            
        case "Quantity":
            cell.valueLabel.text = String(detailDrug.quantity[0])
            
        case "Near":
            cell.valueLabel.text = locationOptions[0]
        
        default:
            print("something broke")
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // Create an option menu as an action sheet
        
        // Add actions to the menu
        let selectHandler = { (action:UIAlertAction!) -> Void in
            let cell = tableView.cellForRowAtIndexPath(indexPath) as! DrugDetailsTableViewCell
            cell.valueLabel.text = action.title
        }
        
        var optionMenu = UIAlertController()

        switch indexPath.row {
        // TODO: Need to make DRY, split out into another function
        case 0:
            optionMenu = UIAlertController(title: "Select Form", message: nil, preferredStyle: .ActionSheet)
            for option in detailDrug.form {
                let action = UIAlertAction(title: option, style: .Default, handler: selectHandler)
                optionMenu.addAction(action)
            }
            
        case 1:
            optionMenu = UIAlertController(title: "Select Dosage", message: nil, preferredStyle: .ActionSheet)
            for option in detailDrug.dosage {
                let action = UIAlertAction(title: option, style: .Default, handler: selectHandler)
                optionMenu.addAction(action)
            }
            
        case 2:
            optionMenu = UIAlertController(title: "Select Quantity", message: nil, preferredStyle: .ActionSheet)
            for option in detailDrug.quantity {
                let action = UIAlertAction(title: String(option), style: .Default, handler: selectHandler)
                optionMenu.addAction(action)
            }
        case 3:
            optionMenu = UIAlertController(title: "Set Location", message: nil, preferredStyle: .ActionSheet)
            for option in locationOptions {
                let action = UIAlertAction(title: String(option), style: .Default, handler: selectHandler)
                optionMenu.addAction(action)
            }

        default:
            print("something broke")
        }
        
        // Display the menu
        self.presentViewController(optionMenu, animated: true, completion: nil)
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }

}

//    //Function to tell use what property indexPath.row is on
//    func returnDrugProperty (field: String) -> String {
//        switch field {
//
//        case "Form":
//            return "form"
//
//        case "Dosage":
//            return "dosage"
//
//        case "Quantity":
//            return "quantity"
//
//        default:
//            print("something broke")
//            return ""
//        }
//    }
