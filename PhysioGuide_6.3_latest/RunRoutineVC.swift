//
//  RunRoutineVC.swift
//  PhysioGuide_7
//
//  Author: Scott Mao, Thomas Breen, Arlene Fu, Rohm Laxton
//  Date created : 2015-11-08.
//  Copyright (c) 2015 Team STAR. All rights reserved.
//  Description:
//  Version 0.1 : Rohm Laxton : Created a view controller and implimented the
//  routine acceptance from previous screen.
//  Version 0.2 : Thomas Breen : Added some logic for determining what to do at each element in the routine array. Need to load the routine from server before this will run.

import UIKit
import YouTubePlayer

class RunRoutineVC: UIViewController {
    @IBOutlet weak var YoutubePlayer: YouTubePlayerView!
    @IBOutlet weak var playButton: UIButton!
    
    var routineName: String! // Gets defined in the prepareForSegue function in RoutinesVC. Use this string to load the exercises with the server.
    
    var index = 0 // The index used to select elements in the routine array.
    var routine = [Exercise]() // Can use this array to store the exercises if we're going that route.
    
    
    
    
    //let's make a sample routine.
    // ***** Sample ******
    func loadSampleExercises() {
        //make for loop to grab all exercises from server and include them to the exercises array
        
        //let icon1 = UIImage(named: "Squat")
        let exercise1 = Exercise(name: "Squat", link: "10yQ6m7w__E")!
        
        //let icon2 = UIImage(named: "bicepsCurl")
        let exercise2 = Exercise(name: "Biceps Curl", link: "nj4qeipu6ic")!
        
        //let icon3 = UIImage(named: "CalfRaise")
        let exercise3 = Exercise(name: "Jogging", link: "YF_OLR7tC70")!
        
        routine += [exercise1, exercise2, exercise3]
    }
    // ***** Sample ******
    
    
    @IBOutlet weak var VideoInRoutine: YouTubePlayerView!
    @IBOutlet weak var currIcon: UIImageView!
    @IBOutlet weak var currName: UILabel!
    var currLink: String!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var nextName: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleExercises() // Comment this out or delete when we can fetch the routines from the server.
        let e = routine[index]
        let link = e.link
        YoutubePlayer.loadVideoID(link)
        
        //load in the routine from server. This below is pseudo-code kind of to help me think. It can be removed once it is done properly.
        /*
        for exercise in serverArray {
        let e = Exercise(name: exercise.name, icon: UIImage(named: exercise.name), link: exercise.link)!
        routine.append[e]
        }
        */
        //finished loading
        
        // Load the information for the inital and next exercise.
        updateInfo()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func next(sender: UIButton) {
        
        
        let Routines : AnyObject! = self.storyboard?.instantiateViewControllerWithIdentifier("RoutinesVC")
        
        
        index++ //Go to the next exercise in the routine.
        if index < routine.count { // Don't try to update if we're out of bounds.
            updateInfo()
            
            let e = routine[index]
            let link = e.link
            
            YoutubePlayer.loadVideoID(link)
            YoutubePlayer.hidden = true
            YoutubePlayer.clear() // Supposedly stops and clears the youtube player's screen. Unfortunately it doesn't kill the player hmm..
            playButton.hidden = false
            
            
        } else { // If we are out of bounds that means the Finish button was clicked, so return to the RunRoutines view controller.
            self.showViewController(Routines as! UIViewController, sender: Routines)
        }
    }
    
    func updateInfo() {
        currIcon.image = routine[index].icon
        currName.text = routine[index].name
        currLink = routine[index].link
        self.title = routineName
        if index >= routine.count-1 { // The array starts at 0 and has routine.count elements. When it reaches element routine.count-1, the next element is out of bounds.
            // Then there is no next exercise.
            nextName.text = ""
            nextButton.setTitle("Finish", forState: .Normal)
        } else {
            nextName.text = routine[index+1].name
        }
    }
    
    
    //     e.g. there is an array OR dictionary
    //    then can use a for loop to change imageForCurrentExercise, NameForCurrentExercise,NextExerciseName
    //    but first need get size , e.g. n
    //
    //the name of icon should be the same as labelText (for convienience)
    //    for (var i = 0; i < n; i++){
    //        VideoInRoutine.loadVideoID(linkString[i])
    //        VideoInRoutine.play()
    //        NameForCurrentExercise.text = labelText[i]
    //        imageForCurrentExercise.image= UIImage(named: labelText[i])
    //        if (i != (n-1))
    //            NextExerciseName.text= labelText[i+1]
    //        else
    //            NextExerciseName.text= "This is your last one!"
    //    }
    //
    
    @IBAction func playvid(sender: AnyObject) {
        
        //YoutubePlayer.loadVideoID(link) // Don't need to load the video when this is selected as it has already started loading in viewDidLoad() or next()
        YoutubePlayer.play()
        YoutubePlayer.hidden = false
        playButton.hidden = true
    }
    
    
}