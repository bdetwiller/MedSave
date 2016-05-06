//
//  SecondViewController.swift
//  MedSave
//
//  Created by Bryant Detwiller on 3/30/16.
//  Copyright © 2016 Bryant Detwiller. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var drugs = [Drug]()
    var filteredDrugs = [Drug]()
    let cellIdentifier = "DrugCell"
    let searchController = UISearchController(searchResultsController: nil)
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: View setup + Dummy data
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drugs.append(Drug(name: "Lipator", generic: "atrovastatin calcium"))
        drugs.append(Drug(name: "Xanax", generic: "alprazolam"))
        drugs.append(Drug(name: "Popchips", generic: "yummy"))
        drugs.append(Drug(name: "Quest Bar", generic: "Probiotic Vegtable Plastic"))
        
        tableView.rowHeight = UITableViewAutomaticDimension
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        
        tableView.tableHeaderView = searchController.searchBar
        self.navigationItem.titleView = searchController.searchBar
        searchController.hidesNavigationBarDuringPresentation = false
        

    }
    
    override func viewWillAppear(animated: Bool) {
        // Make Nav Bar blue (will not work if in viewDidLoad)
        self.navigationController?.navigationBar.setBackgroundImage(nil, forBarMetrics: UIBarMetrics.Default)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Search Bar Code
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredDrugs = drugs.filter { drug in
            return drug.drugName.lowercaseString.containsString(searchText.lowercaseString)
        }
        
        tableView.reloadData()
    }
    
    // MARK: Table View Code
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.active && searchController.searchBar.text != "" {
            return filteredDrugs.count
        }
        return drugs.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Top Drugs"
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        let drug: Drug
        
        if searchController.active && searchController.searchBar.text != "" {
            drug = filteredDrugs[indexPath.row]
        } else {
            drug = drugs[indexPath.row]
        }
        
        cell.textLabel?.text = drug.drugName
        cell.detailTextLabel?.text = drug.genericName
        
        return cell
    }
    
    // MARK: Segue Code
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDrugDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                
                let drug: Drug
                if searchController.active && searchController.searchBar.text != "" {
                    drug = filteredDrugs[indexPath.row]
                } else {
                    drug = drugs[indexPath.row]
                }
                
                let controller = segue.destinationViewController as! DrugDetailsViewController
                controller.detailDrug = drug
                
                tableView.deselectRowAtIndexPath(indexPath, animated: false)
                print(controller.detailDrug)
            }
        }
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
