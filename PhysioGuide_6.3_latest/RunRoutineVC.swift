//
//  RunRoutineVC.swift
//  PhysioGuide_6.3_latest
//
//  Author: Scott Mao, Thomas Breen, Arlene Fu, Rohm Laxton
//  Date created : 2015-11-08.
//  Copyright (c) 2015 Team STAR. All rights reserved.
//  Description:
//  Version 0.1 : Rohm Laxton : Created a view controller and implimented the 
//  routine acceptance from previous screen.

import UIKit

class RunRoutineVC: UIViewController {
    
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
   
    var label1Text = String()
    var label2Text = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label1.text = label1Text
        label2.text = label2Text
        
    }
    
    
    
    
    
    
}
