//
//  JoggingCalc.swift
//  PhysioGuide_7
//
//  Created by Rohm on 12/6/15.
//  Copyright © 2015 Team STAR. All rights reserved.
//

import Foundation

class JoggingCalc {
    
    
    func calcCalories(dur:Int)-> Int{
        // really basic formula, if we can get user info out of healthkit, will help
        // calories burned with average speed jogging = 100/mile via
        // average speed jogging = 6miles/h
        // calories burned 100 / 10 mins
        // 10 per min
        
        let caloriesBurned = (dur * 10)
        return caloriesBurned
        
    }
    
}