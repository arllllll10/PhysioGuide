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
import SwiftyJSON

class MainMenuVC: UIViewController {
    
    //var storedUser = [NSManagedObject]()
    //let localData = LocalSave()
    var arrData :JSON = []
    var myRoutines: [[String:String]] = []
    var routineDict : [String: String] = ["routineName" : "", "exID1" : "", "exID2" : "", "exID3" : "", "exID4" : "", "exID5" : "", "exID6" : "", "exID7" : "", "exID8" : "", "exID9" : "", "exID10" : "", "exID11" : "", "exID12" : "", "exID13" : "", "exID14" : "", "exID15" : "", "exID16" : "", "exID17" : "", "exID18" : "", "exID19" : "", "exID20" : ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let myUser: String! = LocalSave.sharedLocalSave.localUser
        print("Did it work \(myUser)")
        
        let routine = Routines()
        routine.retrieveRoutines(myUser, completionHandler: { swiftyJsonVar in
            self.arrData = swiftyJsonVar
            //print("something  \(state)")
            print(self.arrData)
            print(self.arrData.count)
            for thingy in swiftyJsonVar
            {
                let aRoutine = thingy.1
                //print(aRoutine)
                for subThingy in aRoutine
                {
                    self.routineDict[subThingy.0] = subThingy.1.string
                    
                }
                self.myRoutines.append(self.routineDict)
                
            }
            
            print("Total lines in \(self.myRoutines[0]["routineName"]!)")
        })
        
       
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
