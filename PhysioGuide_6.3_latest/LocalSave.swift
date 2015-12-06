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
