//
//  MainMenuVC.swift
//  PhysioGuide_7
//
//  Author: Scott Mao, Thomas Breen, Arlene Fu, Rohm Laxton
//  Date created : 2015-11-05.
//  Copyright (c) 2015 Team STAR. All rights reserved.
//  Description:

import UIKit
import CoreData

class MainMenuVC: UIViewController {
    
    //var storedUser = [NSManagedObject]()
    //let localData = LocalSave()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let myUser: String! = LocalSave.sharedLocalSave.localUser
        print("Did it work \(myUser)")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
