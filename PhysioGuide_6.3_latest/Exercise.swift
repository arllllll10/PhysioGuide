//
//  Exercise.swift
//  PhysioGuide_7
//
//  Created by Thomas Breen on 2015-11-22.
//  Copyright © 2015 Team STAR. All rights reserved.
//
//  This is a class that specifies the name, icon, and youtube URL for each exercise.

import UIKit

class Exercise {
    // MARK: Attributes
    
    var name: String
    var icon: UIImage?
    var link: String // the URL
    
    // MARK Initialization
    
    init? (name: String, icon: UIImage?, link: String) {
        self.name = name
        self.icon = icon
        self.link = link
        
        // Init fails if there's no name or URL
        
        if (name.isEmpty) {//test// || link.isEmpty) {
            return nil
        }
        
    }
}