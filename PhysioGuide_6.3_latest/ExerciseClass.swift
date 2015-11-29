//
//  ExerciseClass.swift
//  PhysioGuide_7
//
//  Created by Arlene、 on 2015-11-28.
//  Copyright © 2015 Team STAR. All rights reserved.
//


import Foundation
import UIKit


class exercise
{
    var title: String
    var image: UIImage
    var link : String
    
    init(titled: String, link: String, imageName: String)
    {
        self.title = titled
        self.link=link
        if let img = UIImage(named: imageName) {
            image = img
        }
        else {
            image = UIImage(named: "Default")!}
    }
        
}