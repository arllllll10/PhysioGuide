//
//  CreateRoutineVC.swift
//  PhysioGuide_7
//
//  Author: Scott Mao, Thomas Breen, Arlene Fu, Rohm Laxton
//  Date created: 2015-11-21.
//  Copyright © 2015 Team STAR. All rights reserved.
//

import UIKit


class CreateRoutineVC: UIViewController, UICollectionViewDelegate, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: Properties
    
    @IBOutlet weak var ListContainer: UIView!
    @IBOutlet weak var CurrentRoutineContainer: UIView!
    
    @IBOutlet weak var nameYourRoutine: UILabel! // UILabel telling the user to enter name of routine
    @IBOutlet weak var routineName: UITextField! // UITextField for user to enter name into
    @IBOutlet weak var createButton: UIButton! // Button for user to click when they have entered name
    @IBOutlet weak var doneSelectingExercisesButton: UIButton!
    @IBOutlet weak var nameViewBox: UIView! // white UIView for the naming objects to sit in for a cleaner look
    @IBOutlet weak var view2: UIView! // this is the view that will darken the background when name nameViewBox appears
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // handle the test field's user inut through delegate callbacks
        routineName.delegate = self
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func testFieldDidEndEditing(textField: UITextField) {
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    
    @IBAction func nameRoutine(sender: UIButton) {
        //user has clicked Done button after selecting their exercises
        //show the hidden objects so the user can name their routine
        nameViewBox.hidden = false
        
        //disable the functionality of objects in the background manually
        doneSelectingExercisesButton.userInteractionEnabled = false
        ListContainer.userInteractionEnabled = false
        CurrentRoutineContainer.userInteractionEnabled = false
        //can i fade them manually too? yep
        doneSelectingExercisesButton.alpha = 0.4
        ListContainer.alpha = 0.4
        CurrentRoutineContainer.alpha = 0.4
    }
    
    @IBAction func createRoutine(sender: UIButton) {
        
    }
    
}