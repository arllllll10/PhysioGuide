//
//  ExerciseListTVC.swift
//  PhysioGuide_7
//
//  Created by Thomas Breen on 2015-11-22.
//  Copyright © 2015 Team STAR. All rights reserved.
//

import UIKit

class ExerciseListTVC: UITableViewController {
    // MARK: Properties
    
    internal var parentViewController1: CreateRoutineVC!
    
    var exercises = [Exercise]()
    
    func loadSampleExercises() {
        let icon1 = UIImage(named: "Title")
        let exercise1 = Exercise(name: "Squat", icon: icon1, link: "youtube.com/squatexample")!
        
        let icon2 = UIImage(named: "Title")
        let exercise2 = Exercise(name: "Lunge", icon: icon2, link: "youtube.com/lungeexample")!
        
        let icon3 = UIImage(named: "Title")
        let exercise3 = Exercise(name: "Jogging", icon: icon3, link: "youtube.com/joggingexample")!
        
        exercises += [exercise1, exercise2, exercise3]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //load sample data
        loadSampleExercises()
    }
    
    //how many sections should be in the table view controller? Perhaps 3, one for each of Strech/Strength/Cardio
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1 // Currently I don't have any way of know which section an exercise would be in. Need to add some logic in a different function and also an attribute to the object (exercise.swift) being placed into the array so that they can be dequeued into the correct section.
    }
    
    //how many rows are in each section. Currently placing the number of exercises to be safe - could be different though.
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cels are reused and should be dequeued using a cell identifier
        let cellIdentifier = "ExerciseListTVCCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ExerciseListTVCCell
        
        
        // Fetches the appropriate exerecise for the data source layout.
        let exercise = exercises[indexPath.row]
        
        cell.name.text = exercise.name
        cell.icon.image = exercise.icon
        
        return cell
    }
    
    
    
    //make a reference for parentViewController1 so that I can call functions from it
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let vc = segue.destinationViewController as? CreateRoutineVC where segue.identifier == "ExerciseListSegue" {
            self.parentViewController1 = vc
        }
    }
    
    //do something when selected, like add the cell to the CurrentRoutineTVC
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        //let selected = exercises[indexPath.row]
        //self.parentViewController1.addExercise(selected)
        //self.parentViewController1.myfunc()
        //these dont work currently, trying to test passing data between view controllers in containers. They would
        //use the embedded segue to do so.
    }    
    
}
