//
//  SettingPageTableViewController.swift
//  PhysioGuide_7
//
//  Created by Arlene、 on 2015-12-06.
//  Copyright © 2015 Team STAR. All rights reserved.
//

import UIKit
import HealthKit

class SettingPageTableViewController: UITableViewController {
    
    let kAuthorizeHealthKitSection = 4
    
    @IBOutlet weak var mySwitch: UISwitch!
    @IBAction func switchTapped(sender: AnyObject) {
        updateSwitchState()
    }
    
    let healthManager : HealthManager = HealthManager()
    
    func authorizeHealthKit()
    {
        healthManager.authorizeHealthKit { (authorized,  error) -> Void in
            if authorized {
                print("HealthKit authorization received.")
            }
            else
            {
                print("HealthKit authorization denied!")
                if error != nil {
                    print("\(error)")
                }
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func updateSwitchState(){
        if mySwitch.on
        {
            print("here")
            authorizeHealthKit()
        }
    }
    
    /*override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
    switch (indexPath.section, indexPath.row)
    {
    case (kAuthorizeHealthKitSection,0):
    authorizeHealthKit()
    default:
    break
    }
    self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    */
    
    
    // MARK: - Table view data source
    
    /*override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return 6
    }
    */
    
    /*internal var selectedIndexPath:NSIndexPath? = nil
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var cellIdentifier : String
    if(selectedIndexPath != nil)
    {
    switch (selectedIndexPath!.section, selectedIndexPath!.row)
    {
    case (0,4)://(section: 0, row : 5)
    cellIdentifier = "AuthorizeHealthKit"
    let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! WaterTableViewCell
    
    authorizeHealthKit()
    self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    return cell
    default: break
    }
    }
    
    }*/
    
    
    
}
