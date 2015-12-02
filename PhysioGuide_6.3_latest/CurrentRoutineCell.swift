//
//  CurrentRoutineTVCCell.swift
//  PhysioGuide_7
//
//  Created by Thomas Breen on 2015-12-01.
//  Copyright © 2015 Team STAR. All rights reserved.
//

import UIKit

class CurrentRoutineCell: UITableViewCell {
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
