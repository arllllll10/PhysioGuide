//
//  Routines.swift
//  PhysioGuide_6.3_latest
//
//  Author: Scott Mao, Thomas Breen, Arlene Fu, Rohm Laxton
//  Date created : 2015-11-08.
//  Copyright (c) 2015 Team STAR. All rights reserved.
// Version 0.1 : Rohm Laxton : Defining the routines class to be able to
// create a routine from a selection.

import Foundation


class Routines{
    
    //let routineList: [String]
    var exerciseList: [String] = [""]
    
    
    
    func updateExerciseList(routineID : NSInteger)
    {
        // Updates the exerciseList based on the routine selected.
        // In future retrieve the exerciseList from the server based on what was
        // picked in the routineID
        switch routineID{
        case 0: self.exerciseList = ["Lunge", "Squat"]
        case 1: self.exerciseList = ["Jogging", "Lunge"]
        default: self.exerciseList = []
        }
        
    }
    
    
    
}