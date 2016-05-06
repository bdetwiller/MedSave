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
    @IBOutlet weak var tableView: UITableView!
    
    var detailDrug: Drug!
    
    private var fields = ["Form", "Dosage", "Quantity", "Near"]
    private var cellIdentifier = "DrugDetailsCell"
    private var locationOptions = ["Current Location", "City or Zip Code"]
    
    private var selectedFields: [String: String] = [
        "Form" : "",
        "Dosage" : "",
        "Quantity" : "",
        "Location" : ""
    ]
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drugDetailsName.text = detailDrug.drugName + " (generic)"
        drugDetailsGeneric.text = detailDrug.genericName

        self.hideNavigationBar()
        
        
        // hide empty cells
        tableView.tableFooterView = UIView(frame: .zero)
        
        if let detailDrug = detailDrug {
            selectedFields["Form"] = detailDrug.form[0]
            selectedFields["Dosage"] = detailDrug.dosage[0]
            selectedFields["Quantity"] = String(detailDrug.quantity[0])
        }

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
        
        let selectHandler = { (action:UIAlertAction!) -> Void in
            
            //  Update label to show selected form, dosage or quantity
            let cell = tableView.cellForRowAtIndexPath(indexPath) as! DrugDetailsTableViewCell
            cell.valueLabel.text = action.title
            
            // Store selected info in hash
            self.selectedFields[self.fields[indexPath.row]] = action.title
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
    
    // MARK: Segue Code
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showPharmacyView" {
            let perscription = Perscription(drug: detailDrug, form: selectedFields["Form"]!, quantity: selectedFields["Quantity"]!, dosage: selectedFields["Dosage"]!)

                let controller = segue.destinationViewController as! PharmacyListViewController
                controller.perscription = perscription
                
                print(controller.perscription)
            // TODO: Pass location
        }
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
