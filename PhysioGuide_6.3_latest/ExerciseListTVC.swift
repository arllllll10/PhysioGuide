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
    
    let exerciseDict: [String:String] = ["1" : "Back Extensions", "2" : "Biceps Curl", "3" : "Calf Raise", "4" : "Cat Stretch", "5" : "Crunch", "6" : "Front and Back Neck Stretch", "7" : "Back Hyperextensions", "8" : "Jogging", "9" : "Jumping Jacks", "10" : "Knees to Chest", "11" : "Lateral Raise", "12" : "Leg Raises", "13" : "Lunges", "14" : "Modified Hurdler's Stretch", "15" : "Push-ups", "16" : "Quadriceps", "17" : "Reclined Hamstrings", "18" : "Runner's Lunge", "19" : "Russian Twist", "20" : "Shoulders Overhead", "21" : "Shoulders Posterior", "22" : "Shoulder Shrugs", "23" : "Side Hip Abductor", "24" : "Side Lunge", "25" : "Side Neck", "26" : "Side Trunk", "27" : "Spinal Twist", "28" : "Squats", "29" : "Upright Row", "30" : "Wall Calf Stretch"]
    
    //internal var parentViewController1: CreateRoutineVC! //not using right now, trying delegate
    var delegate: ContainerViewControllerProtocol? //seems to be a header file reference
    
    var exercises = [Exercise]()
    
    func loadSampleExercises() {
        //make for loop to grab all exercises from server and include them to the exercises array
        
        var inc : Int = 1
        while(inc < 31)
        {
            let ref = String(inc)
            let anExercise = Exercise(name: exerciseDict[ref]!, link: "youtube.com/squatexample")!
            exercises.append(anExercise)
            inc++
        }
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
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Exercises"
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
    
    
    /* Deciding not to use this version of prepareForSegue method (which uses parentviewcontroller), it wasn't working out.
    //make a reference for parentViewController1 so that I can call functions from it
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if let vc = segue.destinationViewController as? CreateRoutineVC where segue.identifier == "ExerciseListSegue" {
    print("herE\nasd\nasdn\nsdn\ns\nda\nd\nsndn\n")
    self.parentViewController1 = vc
    print("herE\nasd\nasdn\nsdn\ns\nda\nd\nsndn\n")
    }
    }*/
    
    //do something when selected, like add the cell to the CurrentRoutineTVC
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let index = indexPath.row // This is the specified row of the table list. Starts from 0, goes to exercises.count-1
        print("You've selected \(exercises[index].name).")
        //use delegate to pass information to the parent, CreateRoutineVC, which will then pass to CurrentRoutineTVC
        self.delegate?.addExercise(exercises[index]) // Passing the entire exercise object which includes its image, name, and youtube link
    }
    
    
}

protocol ContainerViewControllerProtocol {
    func addExercise(e: Exercise)
}
