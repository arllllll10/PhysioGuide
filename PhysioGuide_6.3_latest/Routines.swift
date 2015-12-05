//
//  Routines.swift
//  PhysioGuide_7
//
//  Author: Scott Mao, Thomas Breen, Arlene Fu, Rohm Laxton
//  Date created : 2015-11-08.
//  Copyright (c) 2015 Team STAR. All rights reserved.
// Version 0.1 : Rohm Laxton : Defining the routines class to be able to
// create a routine from a selection.
// Version 0.2 : Rohm Laxton : Laying the framework for what needs to be 
// added for functions within this class.


import Foundation
import Alamofire
import SwiftyJSON

// might need to pass down the username from login, don't know if the app "knows"
// it at this point innately


class Routines{
    
    //let routineList: [String]
    
    // current list of exercises for the running routine.
    var exerciseList: [String] = [""]
    
    
    // retrieves the routines the username has created and are available by default
    // displays them on the routines screen.
    func retrieveRoutines(username : String, completionHandler: (JSON) -> Void){
        print(username)
        let identity: [String:String] = ["username":username];
        
        
        Alamofire
            .request(.POST, "http://52.27.94.207/showRoutines.php", parameters : identity, encoding: ParameterEncoding.URL)
            .validate()
            .responseJSON {
                (responseData) in
                
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                //print(swiftyJsonVar)
                
                completionHandler(swiftyJsonVar)
        }
        
        
    }
    
    
    // func deleteRoutine(routineID : NSInteger)
    // deletes a routine from the user's routine list
    
    
    // func createRoutine(routineName : String, exerciseList : [String])
    // adds a new routine to the server from the create routine screen.
    func createRoutine(aNewRoutine : [String:String], completionHandler: (Int) -> Void){
        Alamofire
            .request(.POST, "http://52.27.94.207/addRoutine.php", parameters : aNewRoutine, encoding: ParameterEncoding.URL)
            .validate()
            .responseJSON{
                (responseData) in
                let swiftyJsonVar = JSON(responseData.result.value!)
                let confirmation = swiftyJsonVar["status"].int!
                completionHandler(confirmation)
        }
        
    }
    
    
    
    
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