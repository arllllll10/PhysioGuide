//
//  RoutinesVC.swift
//  PhysioGuide_7
//
//  Author: Scott Mao, Thomas Breen, Arlene Fu, Rohm Laxton
//  Date created : 2015-11-05.
//  Copyright (c) 2015 Team STAR. All rights reserved.
//  Description:

import UIKit



class RoutinesVC: UIViewController, RoutineTVCDelegate {
    
    var routineIndex : NSInteger?
    var exercises : [String] = ["", ""]
    
    @IBOutlet var runRoutineButton: UIButton!
    
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
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "routineInternalSegue"{
            let vc = segue.destinationViewController as! RoutineTVC
            vc.selectedIndex = routineIndex
            vc.delegate = self
        }
        
        /*if segue.identifier == "routineRunSeque"{
            let vc = segue.destinationViewController as! RunRoutineVC
            //vc.label1Text = exercises[0]
            //vc.label2Text = exercises[1]
        }*/
        
    }
    
    @IBAction func runRoutineButton(sender: AnyObject) {
        
    }
    
    
}
    

