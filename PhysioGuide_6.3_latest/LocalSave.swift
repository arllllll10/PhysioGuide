//
//  LocalSave.swift
//  PhysioGuide_7
//
//  Created by Rohm on 12/3/15.
//  Copyright © 2015 Team STAR. All rights reserved.
//  Description: Saves local data, specifically the username
//  so that it can be used throughout the app

import Foundation
import UIKit
import CoreData

struct DefaultsKeys
{
    static let localUser = ""
    static let cal1 = ""
    static let cal2 = ""
    static let cal3 = ""
    static let cal4 = ""
    static let cal5 = ""
    
}

class LocalSave {
    
    static let sharedLocalSave = LocalSave()
    
    var localUser: String?

    

    
    var goToBackgroundObserver: AnyObject?
    
    init()
    {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        localUser = defaults.objectForKey(DefaultsKeys.localUser) as! String?

        
        goToBackgroundObserver = NSNotificationCenter.defaultCenter().addObserverForName(UIApplicationDidEnterBackgroundNotification,
            object: nil,
            queue: nil)
            {
                (note: NSNotification!) -> Void in
                let defaults = NSUserDefaults.standardUserDefaults()
                
                defaults.setObject(self.localUser, forKey: DefaultsKeys.localUser)
                
                defaults.synchronize()
            }
    }
    
    /*var storedUser = [NSManagedObject]()
    let moc = DataController().managedObjectContext
    
    func getName() -> String{
        let userFetch = NSFetchRequest(entityName: "User")
        
        do {
            let fetchedUser = try moc.executeFetchRequest(userFetch) as! [User]
            let fetchedName = fetchedUser.first!.name!
            print(fetchedName)
            return fetchedName
        } catch {
            fatalError("bad things happened \(error)")
            
        }
        
        
        /*
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "User")
        
        var myName : String = "none"
        
        do{
            let results = try managedContext.executeFetchRequest(fetchRequest)
            storedUser = results as! [NSManagedObject]
            myName = storedUser[0].valueForKey("name") as! String
            print("mid function \(myName)")
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }

        return myName
        */
    }
    */
    
    
    
    
}

class CalSave{
    
    static let sharedCalSave = CalSave()

    var cal1: String?
    var cal2: String?
    var cal3: String?
    var cal4: String?
    var cal5: String?
    
    
    
    var goToBackgroundObserver: AnyObject?
    
    init()
    {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        cal1 = defaults.objectForKey(DefaultsKeys.localUser) as! String?
        cal2 = defaults.objectForKey(DefaultsKeys.localUser) as! String?
        cal3 = defaults.objectForKey(DefaultsKeys.localUser) as! String?
        cal4 = defaults.objectForKey(DefaultsKeys.localUser) as! String?
        cal5 = defaults.objectForKey(DefaultsKeys.localUser) as! String?
        
        goToBackgroundObserver = NSNotificationCenter.defaultCenter().addObserverForName(UIApplicationDidEnterBackgroundNotification,
            object: nil,
            queue: nil)
            {
                (note: NSNotification!) -> Void in
                let defaults = NSUserDefaults.standardUserDefaults()
                
                defaults.setObject(self.cal1, forKey: DefaultsKeys.cal1)
                defaults.setObject(self.cal2, forKey: DefaultsKeys.cal2)
                defaults.setObject(self.cal3, forKey: DefaultsKeys.cal3)
                defaults.setObject(self.cal4, forKey: DefaultsKeys.cal4)
                defaults.setObject(self.cal5, forKey: DefaultsKeys.cal5)
                
                defaults.synchronize()
        }
    }

    
}
