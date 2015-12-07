//
//  RoutinesVC.swift
//  PhysioGuide_7
//
//  Author: Scott Mao, Thomas Breen, Arlene Fu, Rohm Laxton
//  Date created : 2015-11-05.
//  Copyright (c) 2015 Team STAR. All rights reserved.
//  Description:

import UIKit


class RoutinesVC: UIViewController, RoutineTVCProtocol {
    
    var routineIndex : NSInteger?
    var exercises : [String] = ["", ""]
    var selectedRoutineName: String!
    var routinesUpdated : [[String:String]] = []
    
    @IBOutlet var runRoutineButton: UIButton!
    @IBOutlet weak var routinesContainer: UIView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Rohm - Hide the button, should only be visible on selecting a routine.
        self.runRoutineButton.hidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func myVCDidFinish(controller: RoutineTVC, value: NSInteger) {
        routineIndex = value
        self.runRoutineButton.hidden = false
        // Rohm - returns us to the previous screen, not needed as we are
        // still in the correct screen
        //controller.navigationController?.popViewControllerAnimated(true)
        print(routineIndex, terminator: "")
        
        // Rohm - Had this previously in the button, but apparently the seque is tracked before the button press
        let routinesClass = Routines()
        routinesClass.updateExerciseList(routineIndex!)
        exercises[0] = routinesClass.exerciseList[0]
        exercises[1] = routinesClass.exerciseList[1]
        print(exercises[0] + exercises[1], terminator: "")
    }
    
    
    // Rohm - enables variables to be passed to the container object, and retrived from
    
    
    /*override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "routineInternalSegue"{
            let vc = segue.destinationViewController as! RoutineTVC
            vc.selectedIndex = routineIndex
            vc.delegate = self
        }
        
        if segue.identifier == "routineRunSeque"{
            let vc = segue.destinationViewController as! RunRoutineVC
            vc.label1Text = exercises[0]
            vc.label2Text = exercises[1]
        }
    }*/
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "routineInternalSegue" {
            let routinesContainer = segue.destinationViewController as! RoutineTVC
            routinesContainer.delegate = self
            //routinesContainer.routines = ["something", "another thing", "one last thing"]
            routinesContainer.routinesUpdated = routinesUpdated
        }
        if segue.identifier == "routineRunSeque" {
            let vc = segue.destinationViewController as! RunRoutineVC
            vc.routineName = selectedRoutineName
            vc.routinesUpdated = routinesUpdated
        }
    }
    
    
    func selectRoutine(s: String) -> Void { // Here is the name of the routine which will be used in RunRoutineVC.
        print("The routine name is \(s)")
        // Show the Run button, need to tell RunRoutineVC that this is the name of the routine.
        runRoutineButton.hidden = false // Allow user to run the selected routine.
        selectedRoutineName = s // Store the name passed from RoutineTVC in a global variable so that I can use it in prepareForSegue.
    }
    
    @IBAction func runRoutineButton(sender: AnyObject) {
        runRoutineButton.hidden = true // Hide the button so that the user is forced to select a routine again if they hit Back in the RunRoutineVC (kind of a hack).
    }
    
    
}
    

