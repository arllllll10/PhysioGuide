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
    
    let videoLinks : [String:String] = ["1" : "Z5uZ2Yr8bjY", "2" : "nj4qeipu6ic", "3" : "YF_OLR7tC70", "4" : "DJ9mt7WGxoY", "5" : "3NqsYksrh8U", "6" : "--CkUdvonHM", "7" : "skt2jpiO9K0", "8" : "xZ743T6ETFw", "9" : "BvXfzmkrVcE", "10" : "kbk6cBaAkNE", "11" : "AlOLjU5eoz8", "12" : "ekhduu0U4To", "13" : "BqFqA5r5eKY", "14" : "PueUqzq2Ddw", "15" : "ihYVrZ4lEGk", "16" : "pD88G_xDDGc", "17" : "-dnR5jnYt4A", "18" : "lw1Zcfq8uLc", "19" : "OliUe8K2-g8", "20" : "0_clMt1FRDI", "21" : "3IfDrM8hr4A", "22" : "51VfOKeagfw", "23" : "rDpP-EbBks8", "24" : "Oe-0GdCParQ", "25" : "qA8pkXa4sKA", "26" : "IDCDHX4PUy0", "27" : "lH8qdxViuy8", "28" : "10yQ6m7w__E", "29" : "oOdmnsVX_Pg", "30" : "QhBZt5rb1e0"]
    
    let exIDDict: [String:String] = ["Back Extensions" : "1", "Biceps Curl" : "2","Calf Raise" : "3", "Cat Stretch" : "4", "Crunch" : "5", "Front and Back Neck Stretch" : "6", "Back Hyperextensions" : "7", "Jogging" : "8", "Jumping Jacks" : "9", "Knees to Chest" : "10", "Lateral Raise" : "11", "Leg Raises" : "12", "Lunges" : "13", "Modified Hurdler's Stretch" : "14", "Push-ups" : "15", "Quadriceps" : "16", "Reclined Hamstrings" : "17", "Runner's Lunge" : "18", "Russian Twist" : "19", "Shoulders Overhead" : "20", "Shoulders Posterior" : "21", "Shoulder Shrugs" : "22", "Side Hip Abductor" : "23", "Side Lunge" : "24", "Side Neck" : "25", "Side Trunk" : "26", "Spinal Twist" : "27", "Squats" : "28", "Upright Row" : "29", "Wall Calf Stretch" : "30"]
    
    // Private methods
    private class func Strength() -> ExerciseArray {
    //  (1) Stretch:
        var exercises = [exercise]()
        exercises.append(exercise(titled: "Squats", link: "10yQ6m7w__E",imageName:"28"))
        exercises.append(exercise(titled: "Biceps Curl", link: "nj4qeipu6ic",imageName:"2"))
        exercises.append(exercise(titled: "Calf Raise", link: "YF_OLR7tC70",imageName:"3"))
        exercises.append(exercise(titled: "Lateral Raise", link: "AlOLjU5eoz8",imageName:"11"))
        exercises.append(exercise(titled: "Lunges", link: "BqFqA5r5eKY",imageName:"13"))
        exercises.append(exercise(titled: "Push-ups", link: "ihYVrZ4lEGk",imageName:"15"))
        exercises.append(exercise(titled: "Shoulder Shrugs", link: "51VfOKeagfw",imageName:"22"))
        exercises.append(exercise(titled: "Crunch", link: "3NqsYksrh8U",imageName:"5"))
        exercises.append(exercise(titled: "Russian Twist", link: "OliUe8K2-g8",imageName:"19"))
        exercises.append(exercise(titled: "Leg Raises", link: "ekhduu0U4To",imageName:"12"))
        exercises.append(exercise(titled: "Upright Row", link: "oOdmnsVX_Pg",imageName:"29"))
        exercises.append(exercise(titled: "Back Hyperextensions", link: "skt2jpiO9K0",imageName:"7"))
        return ExerciseArray(named: "Strength", includeExercises: exercises)
    }
    
    //  (2) Cardio:
    private class func Cardio() -> ExerciseArray
    {
        var exercises = [exercise]()
        
        exercises.append(exercise(titled: "Jogging", link: "xZ743T6ETFw",imageName:"8"))
        exercises.append(exercise(titled: "Jumping Jacks", link: "BvXfzmkrVcE",imageName:"9"))
        /*exercises.append(exercise(titled: "", link: "",imageName:".png"))
        exercises.append(exercise(titled: "", link: "",imageName:".png"))
        exercises.append(exercise(titled: "", link: "",imageName:".png"))*/
        return ExerciseArray(named: "Cardio", includeExercises: exercises)
    }
    
    //  (3) Stretch: 
    
    private class func Stretch() -> ExerciseArray
    {
        var exercises = [exercise]()
        
        exercises.append(exercise(titled: "Spinal Twist", link: "lH8qdxViuy8",imageName:"27"))
        exercises.append(exercise(titled: "Knees to Chest", link: "kbk6cBaAkNE",imageName:"10"))
        exercises.append(exercise(titled: "Cat Stretch", link: "DJ9mt7WGxoY",imageName:"4"))
        exercises.append(exercise(titled: "Side Trunk", link: "IDCDHX4PUy0",imageName:"26"))
        exercises.append(exercise(titled: "Back Extensions", link: "Z5uZ2Yr8bjY",imageName:"1"))
        exercises.append(exercise(titled: "Runner's Lunge", link: "lw1Zcfq8uLc",imageName:"18"))
        exercises.append(exercise(titled: "Side Lunge", link: "Oe-0GdCParQ",imageName:"24"))
        exercises.append(exercise(titled: "Reclined Hamstrings", link: "-dnR5jnYt4A",imageName:"17"))
        exercises.append(exercise(titled: "Modified Hurdler's Stretch", link: "PueUqzq2Ddw",imageName:"14"))
        exercises.append(exercise(titled: "Quadriceps", link: "pD88G_xDDGc",imageName:"16"))
        exercises.append(exercise(titled: "Shoulders Overhead", link: "0_clMt1FRDI",imageName:"20"))
        exercises.append(exercise(titled: "Shoulders Posterior", link: "3IfDrM8hr4A",imageName:"21"))
        exercises.append(exercise(titled: "Side Neck", link: "qA8pkXa4sKA",imageName:"25"))
        exercises.append(exercise(titled: "Front and Back Neck Stretch", link: "--CkUdvonHM",imageName:"6"))
        exercises.append(exercise(titled: "Side Hip Abductor", link: "rDpP-EbBks8",imageName:"23"))
        exercises.append(exercise(titled: "Wall Calf Stretch", link: "QhBZt5rb1e0",imageName:"30"))
        
        
        return ExerciseArray(named: "Stretch", includeExercises: exercises)
    }
    
}

