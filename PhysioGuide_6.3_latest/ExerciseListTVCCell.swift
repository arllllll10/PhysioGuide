//
//  ExerciseListTVCCell.swift
//  PhysioGuide_7
//
//  Created by Thomas Breen on 2015-11-22.
//  Copyright © 2015 Team STAR. All rights reserved.
//
//  This file is for the cell of the Exercise List Table View Controller

import UIKit

class ExerciseListTVCCell: UITableViewCell {
    // MARK: Properties
    @IBOutlet weak var icon: UIImageView!    
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
}
