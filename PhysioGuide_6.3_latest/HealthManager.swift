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
    let healthKitStore : HKHealthStore = HKHealthStore()
    
    func authorizeHealthKit(completion :((success: Bool, error:NSError!)-> Void)!)
    {
        let healthKitTypesToRead : Set = [HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierDietaryEnergyConsumed)!, HKObjectType.workoutType()]
        
        let healthKitTypesToWrite : Set = [HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierDietaryEnergyConsumed)!, HKObjectType.workoutType()]
        
        if !HKHealthStore.isHealthDataAvailable()
        {
            let error = NSError(domain:"CMPT275_G6", code: 2, userInfo: [NSLocalizedDescriptionKey:"HealthKit is not available in this Device"])
            if(completion != nil)
            {
                completion(success:false, error:error)
            }
            return
        }
        
        healthKitStore.requestAuthorizationToShareTypes(healthKitTypesToWrite ,
            readTypes: healthKitTypesToRead)
            {(success, error) -> Void in
                if (completion != nil)
                {
                    completion(success:success, error:error)
                }
        }
    }
    
    
    func saveCalorySample(calory : Double, date :NSDate)
    {
        
        let caloryType     = HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierDietaryEnergyConsumed)!
        let caloryQuantity = HKQuantity(unit: HKUnit.calorieUnit(), doubleValue: calory)
        let calorySample   = HKQuantitySample(type: caloryType, quantity: caloryQuantity, startDate: date, endDate: date)
        
        healthKitStore.saveObject(calorySample, withCompletion: { (success, error) -> Void in
            if( error != nil ) {
                print("Error saving Calories sample: \(error!.localizedDescription)")
            } else {
                print("Calories sample saved successfully!")
            }
        })
    }
}
    