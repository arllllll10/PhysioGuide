//
//  RoutinesVC.swift
//  PhysioGuide_6.3_latest
//
//  Created by Thomas Breen on 2015-11-05.
//  Copyright (c) 2015 Team STAR. All rights reserved.
//

import UIKit



class RoutinesVC: UIViewController, RoutineTVCDelegate {
    
    var routineIndex : NSInteger?
    
    @IBAction func runRoutineButton(sender: AnyObject) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func myVCDidFinish(controller: RoutineTVC, value: NSInteger) {
        routineIndex = value
        // Rohm - pops back to the previous screen, unnecessary atm
        //controller.navigationController?.popViewControllerAnimated(true)
        print(routineIndex)
    }
    
    
    // Rohm - enables variables to be passed to the container object, and retrived from
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "mySegue"{
            let vc = segue.destinationViewController as! RoutineTVC
            vc.selectedIndex = routineIndex
            vc.delegate = self
        }
    }
    
}
