//
//  HealthManager.swift
//  PhysioGuide_7
//
//  Created by Arlene、 on 2015-12-06.
//  Copyright © 2015 Team STAR. All rights reserved.
//

import Foundation
import HealthKit

class HealthManager
{
    let healthKitStore:HKHealthStore = HKHealthStore()
    var isavailable = false
    
    func authorizeHealthKit(completion: ((success:Bool, error:NSError!) -> Void)!)
    {
        let healthKitTypesToRead : Set = [HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierActiveEnergyBurned)!,HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierDistanceWalkingRunning)!,HKQuantityType.workoutType()]
        
        let healthKitTypesToWrite : Set = [HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierActiveEnergyBurned)!,HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierDistanceWalkingRunning)!,HKQuantityType.workoutType()]
        
        // 3. If the store is not available (for instance, iPad) return an error and don't go on.
        if !HKHealthStore.isHealthDataAvailable()
        {
            let error = NSError(domain: "com.teamSTAR.PhysioGuide-7", code: 2, userInfo: [NSLocalizedDescriptionKey:"HealthKit is not available in this Device"])
            if( completion != nil )
            {
                completion(success:false, error:error)
            }
            return;
        }
        
        // 4.  Request HealthKit authorizatio
        healthKitStore.requestAuthorizationToShareTypes(healthKitTypesToWrite ,
            readTypes: healthKitTypesToRead)
            {(success, error) -> Void in
                if (completion != nil)
                {
                    print("access granted!")
                    self.isavailable = true
                    completion(success:success, error:error)
                }
        }
        
    }
    
    func saveCalorySample(calory : Double, date :NSDate, dur: Int)
    {
        let durInSeconds :NSTimeInterval = Double(dur) * 60.0
        let gmtOffset : NSTimeInterval = Double(28800)
        //let caloryType     = HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierDietaryEnergyConsumed)!
        let caloryQuantity = HKQuantity(unit: HKUnit.kilocalorieUnit(), doubleValue: calory)
        //let calorySample   = HKQuantitySample(type: caloryType, quantity: caloryQuantity, startDate: date, endDate: date)
        let start = date.dateByAddingTimeInterval(-(durInSeconds+gmtOffset))
        let durDouble : NSTimeInterval = Double(dur)
        let end = date.dateByAddingTimeInterval(-(gmtOffset))
        
        // really basic formula, if we can get user info out of healthkit, will help
        // calories burned with average speed jogging = 100/mile
        // average speed jogging = 6miles/h
        // calories burned 10 per min
        let dist = HKQuantity(unit: HKUnit.mileUnit(), doubleValue:(Double(dur) / 6.0))
        print("start: \(start), end: \(end), dist: \(dist), dur: \(durDouble), cal: \(caloryQuantity)")
        
        
        //let workout = HKWorkout(activityType: HKWorkoutActivityType.Running, startDate: startDate, endDate: endDate, duration: abs(endDate.timeIntervalSinceDate(startDate)), totalEnergyBurned: caloriesQuantity, totalDistance: distanceQuantity, metadata: nil)
        
        let workout = HKWorkout(activityType: HKWorkoutActivityType.Running, startDate: start, endDate: end, duration: abs(end.timeIntervalSinceDate(start)), totalEnergyBurned: caloryQuantity, totalDistance: nil, metadata: nil)
        // let workout2 = HKWorkout(activityType: HKWorkoutActivityType.Running, startDate: start, endDate: end, duration: durDouble, totalEnergyBurned: <#T##HKQuantity?#>, totalDistance: <#T##HKQuantity?#>, metadata: <#T##[String : AnyObject]?#>)
        
        
        healthKitStore.saveObject(workout, withCompletion: { (success, error) -> Void in
            if( error != nil ) {
                print("Error saving Calories sample: \(error!.localizedDescription)")
            } else {
                print("Calories sample saved successfully!")
            }
        })
        
    }
}
    