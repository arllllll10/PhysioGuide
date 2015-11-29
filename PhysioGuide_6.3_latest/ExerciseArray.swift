//
//  ExerciseArray.swift
//  PhysioGuide_7
//
//  Created by Arlene、 on 2015-11-28.
//  Copyright © 2015 Team STAR. All rights reserved.
//
//
//  Here we have several Exercise lines:
//  (1) 
//  (2)
//  (3)

import Foundation

class ExerciseArray
{
    // Variables
    var name: String            // name of the ExerciseArray
    var exercises: [exercise]     // all exercise in the line
    
   class var numberOfExercises: Int {
        get {
            return (ExerciseArray.Strength().exercises.count + ExerciseArray.Cardio().exercises.count + ExerciseArray.Stretch().exercises.count )
        }
    }
    
    init(named: String, includeExercises: [exercise])
    {
        name = named
        exercises = includeExercises
    }
    
    class func ExerciseArrays() -> [ExerciseArray]
    {
        return [self.Strength(), self.Cardio(), self.Stretch()]
    }
    
    // Private methods
    private class func Strength() -> ExerciseArray {
    //  (1) Stretch:
        var exercises = [exercise]()
        exercises.append(exercise(titled: "Squats", link: "10yQ6m7w__E"))
        exercises.append(exercise(titled: "Biceps Curl", link: "nj4qeipu6ic"))
        exercises.append(exercise(titled: "Calf Raise", link: "YF_OLR7tC70"))
        exercises.append(exercise(titled: "Lateral Raise", link: "AlOLjU5eoz8"))
        exercises.append(exercise(titled: "Lunge", link: "BqFqA5r5eKY"))
        exercises.append(exercise(titled: "pushUp", link: "ihYVrZ4lEGk"))
        exercises.append(exercise(titled: "Shoulder Shrug", link: "51VfOKeagfw"))
        exercises.append(exercise(titled: "", link: ""))
        exercises.append(exercise(titled: "", link: ""))
        exercises.append(exercise(titled: "", link: ""))
        exercises.append(exercise(titled: "", link: ""))
        exercises.append(exercise(titled: "", link: ""))
        exercises.append(exercise(titled: "", link: ""))


        return ExerciseArray(named: "Strength", includeExercises: exercises)
    }
    
    //  (2) Cardio:
    private class func Cardio() -> ExerciseArray
    {
        var exercises = [exercise]()
        
        exercises.append(exercise(titled: "", link: ""))
        exercises.append(exercise(titled: "", link: ""))
        exercises.append(exercise(titled: "", link: ""))
        exercises.append(exercise(titled: "", link: ""))
        exercises.append(exercise(titled: "", link: ""))
        exercises.append(exercise(titled: "", link: ""))
        
        return ExerciseArray(named: "Cardio", includeExercises: exercises)
    }
    
    //  (3) Stretch: 
    
    private class func Stretch() -> ExerciseArray
    {
        var exercises = [exercise]()
        
        exercises.append(exercise(titled: "", link: ""))
        exercises.append(exercise(titled: "", link: ""))
        exercises.append(exercise(titled: "", link: ""))
        exercises.append(exercise(titled: "", link: ""))
        exercises.append(exercise(titled: "", link: ""))
        exercises.append(exercise(titled: "", link: ""))
        
        return ExerciseArray(named: "Stretch", includeExercises: exercises)
    }
    
}













