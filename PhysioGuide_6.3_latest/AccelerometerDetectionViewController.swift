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
    var currentMaxRotX: Double = 0.0
    var currentMaxRotY: Double = 0.0
    var currentMaxRotZ: Double = 0.0

    var motionManager = CMMotionManager()
    
    //Variables for accelerometer
    @IBOutlet weak var accX: UILabel!
    @IBOutlet weak var accY: UILabel!
    @IBOutlet weak var accZ: UILabel!
    @IBOutlet weak var maxAccX: UILabel!
    @IBOutlet weak var maxAccY: UILabel!
    @IBOutlet weak var maxAccZ: UILabel!
    
    //Variables for Gyroscope
    @IBOutlet weak var rotX: UILabel!
    @IBOutlet weak var rotY: UILabel!
    @IBOutlet weak var rotZ: UILabel!
    @IBOutlet weak var maxRotX: UILabel!
    @IBOutlet weak var maxRotY: UILabel!
    @IBOutlet weak var maxRotZ: UILabel!

    
    @IBAction func resetMaxValues(){
        currentMaxAccX = 0
        currentMaxAccY = 0
        currentMaxAccZ = 0
        currentMaxRotX = 0
        currentMaxRotY = 0
        currentMaxRotZ = 0
    }
    
    override func viewDidLoad() {
        self.resetMaxValues()
        
        //set motionManager Properties
        //below the variable (like 0.2) is the time interval that how often to update a new value
        //0.2 represent 0.2 second
        motionManager.accelerometerUpdateInterval = 0.2
        motionManager.gyroUpdateInterval=0.2
        
        //collect data
        /*motionManager.startAccelerometerUpdatesToQueue (NSOperationQueue(), withHandler: { (accelerometerData: CMAccelerometerData!, error: NSError!) in
            self.outputAccelerationData(accelerometerData.acceleration)
            if (error != nil){
                print ("\(error)")
            }
        })*/
        
        let _:CMAccelerometerData!
        let _:NSError!
        if (motionManager.accelerometerAvailable){
            motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.currentQueue()!, withHandler: {
            accelerometerData, error in
                //let acceleration = accelerometerData!.acceleration
                //self.outputAccelerationData(acceleration)
                self.outputAccelerationData(accelerometerData!.acceleration)
            })
        }
        
        let _:CMGyroData!
        let _:NSError!
        if (motionManager.gyroAvailable){
            motionManager.startGyroUpdatesToQueue(NSOperationQueue.currentQueue()!, withHandler: {
                gyroData,error in
                self.outputGyroData(gyroData!.rotationRate)
            })
        }
        
        super.viewDidLoad()
        
    }

    
    func outputAccelerationData (acceleration : CMAcceleration){
        accX?.text = "\(acceleration.x)"
        if fabs(acceleration.x) > fabs(currentMaxAccX){
            currentMaxAccX = acceleration.x}
        accY?.text = "\(acceleration.y)"
        if fabs(acceleration.y) > fabs(currentMaxAccY){
            currentMaxAccY = acceleration.y}
        accZ?.text = "\(acceleration.z)"
        if fabs(acceleration.z) > fabs(currentMaxAccZ){
            currentMaxAccZ = acceleration.z}
        maxAccX?.text = "\(currentMaxAccX)"
        maxAccY?.text = "\(currentMaxAccY)"
        maxAccZ?.text = "\(currentMaxAccZ)"
    }
    
    func outputGyroData (rotation : CMRotationRate) {
        rotX?.text = "\(rotation.x)"
        if fabs(rotation.x) > fabs(currentMaxRotX){
            currentMaxRotX = rotation.x}
        rotY?.text = "\(rotation.y)"
        if fabs(rotation.y) > fabs(currentMaxRotY){
            currentMaxRotY = rotation.y}
        rotZ?.text = "\(rotation.z)"
        if fabs(rotation.z) > fabs(currentMaxRotZ){
            currentMaxRotZ = rotation.z}
        maxRotX?.text = "\(currentMaxRotX)"
        maxRotY?.text = "\(currentMaxRotY)"
        maxRotZ?.text = "\(currentMaxRotZ)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
}
