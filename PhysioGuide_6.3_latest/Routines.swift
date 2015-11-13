//
//  Routines.swift
//  PhysioGuide_6.3_latest
//
//  Author: Scott Mao, Thomas Breen, Arlene Fu, Rohm Laxton
//  Date created : 2015-11-08.
//  Copyright (c) 2015 Team STAR. All rights reserved.
// Version 0.1 : Rohm Laxton : Defining the routines class to be able to
// create a routine from a selection.
// Version 0.2 : Rohm Laxton : Laying the framework for what needs to be 
// added for functions within this class.


import Foundation

// might need to pass down the username from login, don't know if the app "knows"
// it at this point innately


class Routines{
    
    //let routineList: [String]
    
    // current list of exercises for the running routine.
    var exerciseList: [String] = [""]
    
    
    // func retrieveRoutines(username : String)
    // retrieves the routines the username has created and are available by default
    // displays them on the routines screen.
    
    
    // func deleteRoutine(routineID : NSInteger)
    // deletes a routine from the user's routine list
    
    
    // func createRoutine(routineName : String, exerciseList : [String])
    // adds a new routine to the server from the create routine screen.
    
    
    // func addDefaultRoutines()
    // adds the default basic routines to the user's database
    
    
    // func checkRoutine(routineName : String) -> bool
    // checks if the current routine name exists, for creation of a routine
    
    
    // For runRoutine screen, updates the exerciseList of the selected screen based
    // on the routine selected to run.
    func updateExerciseList(routineID : NSInteger)
    {
        // In future retrieve the exerciseList from the server based on what was
        // picked in the routineID
        switch routineID{
        case 0: self.exerciseList = ["Lunge", "Squat"]
        case 1: self.exerciseList = ["Jogging", "Lunge"]
        default: self.exerciseList = []
        }
        
    }
    
    
    
}