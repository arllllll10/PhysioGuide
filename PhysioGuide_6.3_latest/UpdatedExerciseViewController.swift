//
//  UpdatedExerciseViewController.swift
//  PhysioGuide_7
//
//  Created by Arlene、 on 2015-11-25.
//  Copyright © 2015 Team STAR. All rights reserved.
//

import UIKit

class UpdatedExerciseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableViewField: UITableView!
    
    // Mark Properties
    let name = ["Squats","Biceps Curl","Calf Raise","Lateral Raise", "Lunge", "pushUp", "Shoulder Shrug"]
    let link = ["10yQ6m7w__E", "nj4qeipu6ic", "YF_OLR7tC70", "AlOLjU5eoz8", "BqFqA5r5eKY", "ihYVrZ4lEGk", "51VfOKeagfw"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewField.dataSource=self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    
    //how many rows are in each section. Currently placing the number of exercises to be safe - could be different though.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return name.count
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cell = tableViewField.dequeueReusableCellWithIdentifier("exerciseCell", forIndexPath: indexPath) as! UpdatedExerciseTVC
        
        // Fetches the appropriate exercise for the data source layout.
        cell.labelName.text = name[indexPath.row]
        cell.icon.image = UIImage(named:name[indexPath.row])
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        self.performSegueWithIdentifier("showView", sender: self)
        
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if (segue.identifier == "showView")
        {
            let destination = segue.destinationViewController as! PlayVideoViewController
            
            let indexPath = self.tableViewField.indexPathForSelectedRow!
            
            let titleString = link[indexPath.row]
            
            destination.linkString = titleString
            
            self.tableViewField.deselectRowAtIndexPath(indexPath, animated: true)
        
        }
        
    }
  
   
}
