//
//  UpdatedExerciseTableViewController.swift
//  PhysioGuide_7
//
//  Created by Arlene、 on 2015-11-25.
//  Copyright © 2015 Team STAR. All rights reserved.
//

import UIKit
import YouTubePlayer

class UpdatedExerciseTableViewController: UITableViewController {
    // Mark Properties
    var exercises = [Exercise]()
    
    func loadSampleExercises() {
        let icon1 = UIImage(named: "Squats")
        let exercise1 = Exercise(name: "Squat", icon: icon1, link : "10yQ6m7w__E")!
        
        let icon2 = UIImage(named: "Biceps Curl")
        let exercise2 = Exercise(name: "Biceps Curl", icon: icon2, link: "nj4qeipu6ic")!
        
        let icon3 = UIImage(named: "Calf Raise")
        let exercise3 = Exercise(name: "Calf Raise", icon: icon3, link: "YF_OLR7tC70")!
        
        let icon4 = UIImage(named: "Lateral Raise")
        let exercise4 = Exercise(name: "Lateral Raise", icon: icon4, link: "AlOLjU5eoz8")!
        
        let icon5 = UIImage(named: "Lunge")
        let exercise5 = Exercise(name: "Lunge", icon: icon5, link: "BqFqA5r5eKY")!
        
        let icon6 = UIImage(named: "pushUp")
        let exercise6 = Exercise(name: "pushUp", icon: icon6, link: "ihYVrZ4lEGk")!
        
        let icon7 = UIImage(named: "Shoulder Shrug")
        let exercise7 = Exercise(name: "Shoulder Shrug", icon: icon7, link: "51VfOKeagfw")!
        
        
        exercises += [exercise1, exercise2, exercise3, exercise4, exercise5, exercise6, exercise7]
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load the sample data.
        loadSampleExercises()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    //how many rows are in each section. Currently placing the number of exercises to be safe - could be different though.
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "UpdatedExerciseCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! UpdatedExerciseTableViewCell
        
        // Fetches the appropriate exercise for the data source layout.
        let exercise = exercises[indexPath.row]
        cell.nameLabel.text = exercise.name
        cell.icon.image = exercise.icon
        cell.checkItOut.tag = indexPath.row
        cell.checkItOut.addTarget(self, action: "playVideo", forControlEvents: .TouchUpInside)

        return cell
    }
    
   /* @IBAction func playVideo(sender: UIButton) {
        
        let link = (exercises[indexPath.row]).link
        VideoPlayer.loadVideoID(link)
        VideoPlayer.play()
        //let firstActivityItem = "\(titleString!)"
        
        //let activityViewController : UIActivityViewController = UIActivityViewController(activityItems: [firstActivityItem], applicationActivities: nil)
        
        //self.presentViewController(activityViewController, animated: true, completion: nil)
        
    }*/

  

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
