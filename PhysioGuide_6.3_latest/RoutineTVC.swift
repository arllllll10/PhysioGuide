//
//  RoutineTVC.swift
//  PhysioGuide_6.3_latest
//
//  Author: Scott Mao, Thomas Breen, Arlene Fu, Rohm Laxton
//  Date created : 2015-11-07.
//  Copyright (c) 2015 Team STAR. All rights reserved.
//  Description:
//
//  Version 0.1 : Rohm Laxton : Created the container, linked through the selected routine

import UIKit

// creates the connection that links to outside of the container
protocol RoutineTVCDelegate{
    func myVCDidFinish(controller:RoutineTVC, value:NSInteger)
    
}

class RoutineTVC: UITableViewController {
    

    var selectedIndex : NSInteger?
    
    var delegate : RoutineTVCDelegate? = nil
    
   // these guys call back the value to be referenced in RoutinesVC
    @IBAction func routine1Button(sender: AnyObject) {
        if(delegate != nil){
            delegate!.myVCDidFinish(self, value: 0)
        }
    }
        
    @IBAction func routine2Button(sender: AnyObject) {
        if(delegate != nil){
            delegate!.myVCDidFinish(self, value: 1)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }



}
