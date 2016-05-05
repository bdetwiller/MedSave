//
//  Extensions.swift
//  MedSave
//
//  Created by Bryant Detwiller on 5/5/16.
//  Copyright © 2016 Bryant Detwiller. All rights reserved.
//

import UIKit

extension UIView{
    
    func addBorderOf(color color:UIColor?, withWidth width:CGFloat?, ofCornorRadius radius:CGFloat?) {
        self.layer.borderColor = color?.CGColor
        
        if let width = width{
            self.layer.borderWidth = width
        } else {
            self.layer.borderWidth = 0
        }
        if let color = color{
            self.layer.borderColor = color.CGColor
        } else {
            self.layer.borderColor = UIColor.whiteColor().CGColor
        }
        if let radius = radius{
            self.layer.cornerRadius = radius
        } else {
            self.layer.cornerRadius = 0
        }
        
        self.clipsToBounds = true
        
    }
}
