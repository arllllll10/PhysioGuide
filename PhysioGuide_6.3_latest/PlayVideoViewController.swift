//
//  PlayVideoViewController.swift
//  PhysioGuide_7
//
//  Created by Arlene、 on 2015-11-28.
//  Copyright © 2015 Team STAR. All rights reserved.
//

import UIKit
import YouTubePlayer


class PlayVideoViewController: UIViewController {

    @IBOutlet weak var PlayVideo: YouTubePlayerView!
    
    var linkString: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        PlayVideo.loadVideoID(linkString)
        PlayVideo.play()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
