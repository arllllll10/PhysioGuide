//
//  CreateRoutineVC.swift
//  PhysioGuide_7
//
//  Author: Scott Mao, Thomas Breen, Arlene Fu, Rohm Laxton
//  Date created: 2015-11-21.
//  Copyright © 2015 Team STAR. All rights reserved.
//

import UIKit


class CreateRoutineVC: UIViewController, UICollectionViewDelegate {
    
    // MARK: Vars
    
    @IBOutlet weak var ListContainer: UIView!
    @IBOutlet weak var CurrentRoutineContainer: UIView!
    
    @IBOutlet weak var nameYourRoutine: UILabel! // UILabel telling the user to enter name of routine
    @IBOutlet weak var routineName: UITextField! // UITextField for user to enter name into
    @IBOutlet weak var createButton: UIButton! // Button for user to click when they have entered name
    @IBOutlet weak var doneSelectingExercisesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ListContainer.hidden = false
        CurrentRoutineContainer.hidden = false
        //how to make them viewed?
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Functions
    
    @IBAction func nameRoutine(sender: UIButton) {
        //user has clicked Done button after selecting their exercises
        //show the hidden objects so the user can name their routine
        nameYourRoutine.hidden = false
        routineName.hidden = false
        createButton.hidden = false
        //hide the background items or fade them somehow
        doneSelectingExercisesButton.hidden = true
    }
    
    @IBAction func createRoutine(sender: UIButton) {
        
    }
    
}