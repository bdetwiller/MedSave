//
//  MyMedsViewController.swift
//  MedSave
//
//  Created by Bryant Detwiller on 3/30/16.
//  Copyright © 2016 Bryant Detwiller. All rights reserved.
//

import UIKit

class MyMedsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var perscriptions = [Perscription]()
    var cellIdentifier = "PerscriptionCell"

    @IBOutlet weak var card: UIView!
    @IBOutlet weak var table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: Add Real data
        let perscription1 = Perscription(drug: Drug(name: "Popchips", generic: "yummy"), form: "Tablet", quantity: "10", dosage: "15 mg")
        perscription1.selectedPharmacy = Pharmacy(name: "CVS", address: "245 W 17th Street")
        perscription1.price = "$6.77"
        let perscription2 = Perscription(drug: Drug(name: "Quest Bars", generic: "probiotic vegtable plastic"), form: "Tablet", quantity: "10", dosage: "15 mg")
        perscription2.selectedPharmacy = Pharmacy(name: "Walgreens", address: "205 Avenue A")
        perscription2.price = "$10.00"
        perscriptions.append(perscription1)
        perscriptions.append(perscription2)
        
        
//        let orangeBackground1 = UIColor(red:1.00, green:0.61, blue:0.10, alpha:0.1).CGColor
//        let orangeBackground2 = UIColor(red:1.00, green:0.77, blue:0.38, alpha:0.1).CGColor
//        let orangeBoarder = UIColor(red:1.00, green:0.61, blue:0.10, alpha:1.0)
        let blueBoarder = UIColor(red:0.61, green:0.81, blue:0.96, alpha:1.0)
        let blueBackground = UIColor(red:0.15, green:0.60, blue:0.95, alpha:0.1).CGColor
        card.layer.backgroundColor = blueBackground
        card.addBorderOf(color: blueBoarder, withWidth: 2.0, ofCornorRadius: 4.0)
        
        table.rowHeight = UITableViewAutomaticDimension
        table.estimatedRowHeight = 90
        table.tableFooterView = UIView(frame: .zero)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: TableView
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return perscriptions.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! PerscriptionTableViewCell
        let perscription = perscriptions[indexPath.row]
        let perscriptionDetails = perscription.drug.getFirstDosage() + ", " + String(perscription.drug.getFirstQuantity()) + " " + perscription.drug.getFirstForm()
        
        cell.drugNameLabel?.text = "(" + perscription.drug.genericName + ") " + perscription.drug.drugName
        cell.perscriptionDetailsLabel?.text = perscriptionDetails
        cell.priceLabel?.text = perscription.price
        cell.pharmacyLabel?.text = perscription.selectedPharmacy?.name
        return cell
    }
    
    // MARK: Segue Code
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showSavedDrugPhramacies" {
            if let indexPath = table.indexPathForSelectedRow {
                
                let perscription = perscriptions[indexPath.row]
                let controller = segue.destinationViewController as! PharmacyListViewController
                
                controller.perscription = perscription
                table.deselectRowAtIndexPath(indexPath, animated: false)
            }
        }
    }




}

