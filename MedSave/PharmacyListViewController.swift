//
//  PharmacyListViewController.swift
//  MedSave
//
//  Created by Bryant Detwiller on 4/5/16.
//  Copyright © 2016 Bryant Detwiller. All rights reserved.
//

import UIKit

class PharmacyListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var pharmacies = [Pharmacy]()
    var cellIdentifier = "PharmacyCellIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Dummy data
        pharmacies.append(Pharmacy(name: "CVS", address: "245 West 17th Street"))
        pharmacies.append(Pharmacy(name: "Walgreens", address: "205 Avenue A"))
        pharmacies.append(Pharmacy(name: "CVS", address: "14th and 12th"))
        pharmacies.append(Pharmacy(name: "Duane Reade", address: "111 8th Avenue"))
        pharmacies.append(Pharmacy(name: "CVS", address: "394 West 16th Street"))
        pharmacies.append(Pharmacy(name: "Walgreens", address: "203 1st Ave"))
        pharmacies.append(Pharmacy(name: "CVS", address: "14th and 23rd"))
        pharmacies.append(Pharmacy(name: "Duane Reade", address: "52 Houston"))
        
       // self.tableView.rowHeight = UITableViewAutomaticDimension


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Table View Code
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pharmacies.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        let pharmacy = pharmacies[indexPath.row]
        
        cell.textLabel?.text = pharmacy.name
        cell.detailTextLabel?.text = pharmacy.address
        
        return cell
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
