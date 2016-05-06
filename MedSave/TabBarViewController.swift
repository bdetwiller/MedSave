//
//  TabBarViewController.swift
//  MedSave
//
//  Created by Bryant Detwiller on 5/6/16.
//  Copyright © 2016 Bryant Detwiller. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        // Custom backbutton
        UINavigationBar.appearance().tintColor = UIColor(red:0.15, green:0.60, blue:0.95, alpha:1.0)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        let index : Int = (tabBarController.viewControllers?.indexOf(viewController))!
        if index == 0 {
            let navigationController = viewController as? UINavigationController
            navigationController?.popToRootViewControllerAnimated(true)
        }
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
