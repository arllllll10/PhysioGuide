//
//  AccelerometerDetectionViewController.swift
//  PhysioGuide_7
//
//  Created by Arlene、 on 2015-12-05.
//  Copyright © 2015 Team STAR. All rights reserved.
//

import UIKit
import CoreMotion

class AccelerometerDetectionViewController: UIViewController {

    var currentMaxAccX: Double = 0.0
    var currentMaxAccY: Double = 0.0
    var currentMaxAccZ: Double = 0.0
    
    var motionManager = CMMotionManager()
    
    @IBOutlet weak var accX: UILabel!
    @IBOutlet weak var accY: UILabel!
    @IBOutlet weak var accZ: UILabel!
    @IBOutlet weak var maxAccX: UILabel!
    @IBOutlet weak var maxAccY: UILabel!
    @IBOutlet weak var maxAccZ: UILabel!
    
    @IBAction func resetMaxValues(){
        currentMaxAccX = 0
        currentMaxAccY = 0
        currentMaxAccZ = 0
    }
    
    override func viewDidLoad() {
        self.resetMaxValues()
        
        //set motionManager Properties
        //below the variable (like 0.2) is the time interval that how often to update a new value
        //0.2 represent 0.2 second
        motionManager.accelerometerUpdateInterval = 0.2
        
        //collect data
        motionManager.startAccelerometerUpdatesToQueue (NSOperationQueue.currentQueue(), withHandler: { (acceletometerData : CMAccelerometerData!, error: NSError!) -> Void in
            self.outputAccelerationData(acceletometerData.acceleration)
            if (error != nil){
                print ("\(error)")
            }
        })
        super.viewDidLoad()
        
    }

    
    func outputAccelerationData (acceleration : CMAcceleration){
        accX?.text = "\(acceleration.x).2fg"
        if fabs(acceleration.x) > fabs(currentMaxAccX){
            currentMaxAccX = acceleration.x}
        accY?.text = "\(acceleration.y).2fg"
        if fabs(acceleration.y) > fabs(currentMaxAccY){
            currentMaxAccY = acceleration.y}
        accZ?.text = "\(acceleration.z).2fg"
        if fabs(acceleration.z) > fabs(currentMaxAccZ){
            currentMaxAccZ = acceleration.z}
        maxAccX?.text = "\(currentMaxAccX).2fg"
        maxAccY?.text = "\(currentMaxAccY).2fg"
        maxAccZ?.text = "\(currentMaxAccZ).2fg"

        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
}
