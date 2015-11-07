//
//  ExercisesVC.swift
//  PhysioGuide_6.3_latest
//
//  Created by Thomas Breen on 2015-11-05.
//  Copyright (c) 2015 Team STAR. All rights reserved.
//

import UIKit

class ExercisesVC: UITableViewController {
    
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeText(sender: UIButton) {
        if label.text == "changed" {
            label.text = "Label"
        } else {
            label.text = "changed"
        }
    }
        
}
