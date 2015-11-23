
//
//  TryNewExercise.swift
//  PhysioGuide_7
//
//  Created by Arlene、 on 2015-11-23.
//  Copyright © 2015 Team STAR. All rights reserved.
//

import UIKit
// Import Swift module
import YouTubePlayer

class TryNewExercise: UIViewController {
    
    @IBOutlet var videoPlayer: YouTubePlayerView!
    // init YouTubePlayerView w/ playerFrame rect (assume playerFrame declared)
    //var videoPlayer = YouTubePlayerView(frame: CGRectMake(0, 0, 375, 211))
   // var frame: CGRect = CGRectMake(0, 0, 0, 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func play1(sender: UIButton) {
       // let myVideoURL = NSURL(string: "https://www.youtube.com/watch?v=wQg3bXrVLtg")
       // videoPlayer.loadVideoURL(myVideoURL!)
        videoPlayer.loadVideoID("I87A99w_w2g")
        videoPlayer.play()
    }
    
   @IBAction func play2(sender: UIButton) {
       // let myVideoURL = NSURL(string: "https://www.youtube.com/watch?v=wQg3bXrVLtg")
       // videoPlayer.loadVideoURL(myVideoURL!)
    videoPlayer.loadVideoID("IGo5X48VPdM")
        videoPlayer.play()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
