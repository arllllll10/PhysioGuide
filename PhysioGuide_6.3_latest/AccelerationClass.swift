//
//  AccelerationClass.swift
//  PhysioGuide_7
//
//  Created by Arlene、 on 2015-12-06.
//  Copyright © 2015 Team STAR. All rights reserved.
//

import Foundation
import CoreMotion

class AccelerationClass {
    
    var currentMaxAccX: Double = 0.0
    var currentMaxAccY: Double = 0.0
    var currentMaxAccZ: Double = 0.0
    var currentMaxRotX: Double = 0.0
    var currentMaxRotY: Double = 0.0
    var currentMaxRotZ: Double = 0.0
    
    var motionManager = CMMotionManager()
    
    //Variables for accelerometer
    var accX: Double = 0.0
    var accY: Double = 0.0
    var accZ: Double = 0.0
    var maxAccX: Double = 0.0
    var maxAccY: Double = 0.0
    var maxAccZ: Double = 0.0
    
    //Variables for Gyroscope
    var rotX: Double = 0.0
    var rotY: Double = 0.0
    var rotZ: Double = 0.0
    var maxRotX: Double = 0.0
    var maxRotY: Double = 0.0
    var maxRotZ: Double = 0.0

    func resetMaxValues()
    {
        currentMaxAccX = 0
        currentMaxAccY = 0
        currentMaxAccZ = 0
        currentMaxRotX = 0
        currentMaxRotY = 0
        currentMaxRotZ = 0
    }
    
    func getValue(){
        self.resetMaxValues()
        motionManager.accelerometerUpdateInterval = 0.2
        motionManager.gyroUpdateInterval=0.2
        let _:CMAccelerometerData!
        let _:NSError!
        if (motionManager.accelerometerAvailable){ motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.currentQueue()!, withHandler: {
            accelerometerData, error in
            //let acceleration = accelerometerData!.acceleration
            //self.outputAccelerationData(acceleration)
            self.outputAccelerationData(accelerometerData!.acceleration)
            })
        }
    
        let _:CMGyroData!
        let _:NSError!
        if (motionManager.gyroAvailable){
            motionManager.startGyroUpdatesToQueue(NSOperationQueue.currentQueue()!, withHandler: { gyroData,error in
                self.outputGyroData(gyroData!.rotationRate)
            })
        }
    }
    
    func outputAccelerationData (acceleration : CMAcceleration){
        accX = acceleration.x
        if fabs(acceleration.x) > fabs(currentMaxAccX){
            currentMaxAccX = acceleration.x}
        accY = acceleration.y
        if fabs(acceleration.y) > fabs(currentMaxAccY){
            currentMaxAccY = acceleration.y}
        accZ = acceleration.z
        if fabs(acceleration.z) > fabs(currentMaxAccZ){
            currentMaxAccZ = acceleration.z}
        maxAccX = currentMaxAccX
        maxAccY = currentMaxAccY
        maxAccZ = currentMaxAccZ
    }
    
    func outputGyroData (rotation : CMRotationRate) {
        rotX = rotation.x
        if fabs(rotation.x) > fabs(currentMaxRotX){
            currentMaxRotX = rotation.x}
        rotY = rotation.y
        if fabs(rotation.y) > fabs(currentMaxRotY){
            currentMaxRotY = rotation.y}
        rotZ = rotation.z
        if fabs(rotation.z) > fabs(currentMaxRotZ){
            currentMaxRotZ = rotation.z}
        maxRotX = currentMaxRotX
        maxRotY = currentMaxRotY
        maxRotZ = currentMaxRotZ
    }

    //the following is the sudo code for RunRoutine page
    //the following code is specifically for the exercise which need accelerometer or gyroscope
    //e.g. biscep curl
    //for run routine page
    var exerciseName : String
    var currentAcc1 : Double
    var currentAcc0 : Double
    if (exerciseName == "Biscep Curl"){
        currentAcc = acceleration.x
        if (currentAcc > )
    }
    
    
    
    
}



















