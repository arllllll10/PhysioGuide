
//
//  UpdatedExerciseView.swift
//  PhysioGuide_7
//
//  Created by Arlene、 on 2015-11-23.
//  Copyright © 2015 Team STAR. All rights reserved.
//

import UIKit
// Import Swift module
import YouTubePlayer

class UpdatedExerciseView: UIViewController {
    
    @IBOutlet var VideoPlayer: YouTubePlayerView!

    // init YouTubePlayerView w/ playerFrame rect (assume playerFrame declared)
    //var videoPlayer = YouTubePlayerView(frame: CGRectMake(0, 0, 375, 211))
    // var frame: CGRect = CGRectMake(0, 0, 0, 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func play1(sender: UIButton) {
        VideoPlayer.loadVideoID("10yQ6m7w__E")
        VideoPlayer.play()
    }
    @IBAction func play2(sender: UIButton) {
        VideoPlayer.loadVideoID("B-K8NO84W98")
        VideoPlayer.play()
    }
    
    @IBAction func CalfRaise(sender: UIButton) {
        VideoPlayer.loadVideoID("YF_OLR7tC70")
        VideoPlayer.play()
    }
    
    @IBAction func pushup(sender: UIButton) {
        VideoPlayer.loadVideoID("ihYVrZ4lEGk")
        VideoPlayer.play()
    }
    @IBAction func Lateralraise(sender: UIButton) {
        VideoPlayer.loadVideoID("AlOLjU5eoz8")
        VideoPlayer.play()
    }
    
    @IBAction func shouldershrug(sender: UIButton) {
        VideoPlayer.loadVideoID("51VfOKeagfw")
        VideoPlayer.play()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
