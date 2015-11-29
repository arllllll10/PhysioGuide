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
        exercises.append(exercise(titled: "Squats", link: "10yQ6m7w__E",imageName:"squat.png"))
        exercises.append(exercise(titled: "Biceps Curl", link: "nj4qeipu6ic",imageName:"bicepsCurl.png"))
        exercises.append(exercise(titled: "Calf Raise", link: "YF_OLR7tC70",imageName:"CalfRaise.png"))
        exercises.append(exercise(titled: "Lateral Raise", link: "AlOLjU5eoz8",imageName:"lateralRaise.png"))
        exercises.append(exercise(titled: "Lunge", link: "BqFqA5r5eKY",imageName:"lunge.png"))
        exercises.append(exercise(titled: "pushUp", link: "ihYVrZ4lEGk",imageName:"pushUp.png"))
        exercises.append(exercise(titled: "Shoulder Shrug", link: "51VfOKeagfw",imageName:"shoulderShrug.png"))
        exercises.append(exercise(titled: "Crunch", link: "3NqsYksrh8U",imageName:"crunch.png"))
        exercises.append(exercise(titled: "Russian Twist", link: "OliUe8K2-g8",imageName:"russianTwist.png"))
        exercises.append(exercise(titled: "Leg Raise", link: "ekhduu0U4To",imageName:"legRaise.png"))
        //exercises.append(exercise(titled: "Back Extension with machine", link: "",imageName:"backExtension(machine).png"))
        return ExerciseArray(named: "Strength", includeExercises: exercises)
    }
    
    //  (2) Cardio:
    private class func Cardio() -> ExerciseArray
    {
        var exercises = [exercise]()
        
        exercises.append(exercise(titled: "Jogging", link: "xZ743T6ETFw",imageName:"jogging.png"))
        exercises.append(exercise(titled: "Jumping Jacks", link: "BvXfzmkrVcE",imageName:"jumpingJacks.png"))
        /*exercises.append(exercise(titled: "", link: "",imageName:".png"))
        exercises.append(exercise(titled: "", link: "",imageName:".png"))
        exercises.append(exercise(titled: "", link: "",imageName:".png"))*/
        return ExerciseArray(named: "Cardio", includeExercises: exercises)
    }
    
    //  (3) Stretch: 
    
    private class func Stretch() -> ExerciseArray
    {
        var exercises = [exercise]()
        
        exercises.append(exercise(titled: "Spinal Twist", link: "lH8qdxViuy8",imageName:"spinalTwist.png"))
        exercises.append(exercise(titled: "Knees to Chest", link: "kbk6cBaAkNE",imageName:"kneesToChest.png"))
        exercises.append(exercise(titled: "Cat Stretch", link: "DJ9mt7WGxoY",imageName:"catStrecth.png"))
        exercises.append(exercise(titled: "Side Trunk", link: "IDCDHX4PUy0",imageName:"sideTrunk.png"))
        exercises.append(exercise(titled: "Back Extension", link: "Z5uZ2Yr8bjY",imageName:"backExtension.png"))
        exercises.append(exercise(titled: "Runner's Lunge", link: "lw1Zcfq8uLc",imageName:"runner'sLunge.png"))
        exercises.append(exercise(titled: "Side Lunge", link: "Oe-0GdCParQ",imageName:"sideLunge.png"))
        exercises.append(exercise(titled: "Reclined Hamstring Stretch", link: "-dnR5jnYt4A",imageName:"reclinedHamstringStretch.png"))
        exercises.append(exercise(titled: "Modified Hurdler Stretch", link: "PueUqzq2Ddw",imageName:"modifiedHurdlerStretch.png"))
        exercises.append(exercise(titled: "Shoulder Overhead", link: "0_clMt1FRDI",imageName:"shoulderOverhead.png"))
        exercises.append(exercise(titled: "Shoulder Posterior", link: "3IfDrM8hr4A",imageName:"shoulderPosteior.png"))
        exercises.append(exercise(titled: "Side Neck", link: "qA8pkXa4sKA",imageName:"sideNeck.png"))
        exercises.append(exercise(titled: "Front and Back Neck", link: "--CkUdvonHM",imageName:"frontAndBackNeck.png"))
        exercises.append(exercise(titled: "Hip Adductor", link: "rDpP-EbBks8",imageName:"hipAdductor.png"))
        
        return ExerciseArray(named: "Stretch", includeExercises: exercises)
    }
    
}

