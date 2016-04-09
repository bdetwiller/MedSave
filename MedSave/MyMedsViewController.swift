//
//  FirstViewController.swift
//  MedSave
//
//  Created by Bryant Detwiller on 3/30/16.
//  Copyright © 2016 Bryant Detwiller. All rights reserved.
//

import UIKit

class MyMedsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var perscriptions = [Perscription]()
    var cellIdentifier = "PerscriptionCell"


    override func viewDidLoad() {
        super.viewDidLoad()
        perscriptions.append(Perscription(drug: Drug(name: "Popchips", generic: "yummy"), selectedPharmacy: Pharmacy(name: "CVS", address: "245 W 17th Street")))
        perscriptions.append(Perscription(drug: Drug(name: "Quest Bars", generic: "probiotic vegtable plastic"), selectedPharmacy: Pharmacy(name: "Walgreens", address: "205 Avenue A")))
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //TableView
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return perscriptions.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        let perscription = perscriptions[indexPath.row]
        cell.textLabel?.text = perscription.drug.drugName
        cell.detailTextLabel?.text = perscription.price

        return cell
    }



}

