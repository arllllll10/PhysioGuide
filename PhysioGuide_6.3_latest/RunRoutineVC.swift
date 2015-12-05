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

import UIKit
import YouTubePlayer

class RunRoutineVC: UIViewController {
    
    @IBOutlet weak var VideoInRoutine: YouTubePlayerView!
    
    //-------------------Need Modify--------------//
    //here should input an link which is the current exercise run in routine
    var linkString: String!
    //the properties (name, icon, link) for multiples exercise should be done later
    var labelText = String()
    //-------------------Need Modify--------------//

    @IBOutlet weak var imageForCurrentExercise: UIImageView!
    @IBOutlet weak var NameForCurrentExercise: UILabel!
    @IBOutlet weak var NextExerciseName: UILabel!
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

    
    
}