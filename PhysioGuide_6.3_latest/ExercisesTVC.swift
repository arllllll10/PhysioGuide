//
//  ExercisesTVC.swift
//  PhysioGuide_6.3_latest
//
//  Author: Scott Mao, Thomas Breen, Arlene Fu, Rohm Laxton
//  Date created : 2015-11-07.
//  Copyright (c) 2015 Team STAR. All rights reserved.
//  Description:

import UIKit

class ExercisesTVC: UITableViewController {

    // video players - turn into one video player that the others update
    @IBOutlet var webViewSquats: UIWebView!
    @IBOutlet var webViewJogging: UIWebView!
    @IBOutlet var webViewLunges: UIWebView!
    
    // URLs for the videos - todo store in dictionary (key - url)
    let urlList: [String] = ["_NVoHKFDyL4","3ZTzH6dkR1s","B-K8NO84W98"]
    //let squatsURL = "_NVoHKFDyL4"
    //let joggingURL = "3ZTzH6dkR1s"
    //let lungeURL = "B-K8NO84W98"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // display videos
        self.webViewSquats.loadHTMLString(setupWebplayer(urlList[0]), baseURL: nil)
        self.webViewJogging.loadHTMLString(setupWebplayer(urlList[1]), baseURL: nil)
        self.webViewLunges.loadHTMLString(setupWebplayer(urlList[2]), baseURL: nil)
        

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // setup videoplayers
    func setupWebplayer(urlAddress: String) -> String
    {
        let height = 100
        let width = 200
        let frame = 0
        let Code:NSString = "<iframe width=\(width) height=\(height) src=http://www.youtube.com/embed/\(urlAddress) frameborder=\(frame) allowfullscreen></iframe>"
        return Code as String
    }
    
    // MARK: - Table view data source

    
}
