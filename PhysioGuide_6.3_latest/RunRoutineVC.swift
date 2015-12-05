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
    var label1Text = String()
    //-------------------Need Modify--------------//

    
    @IBOutlet weak var imageForCurrentExercise: UIImageView!

    @IBOutlet weak var NameForCurrentExercise: UILabel!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        VideoInRoutine.loadVideoID(linkString)
        VideoInRoutine.play()
        NameForCurrentExercise.text = label1Text
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}