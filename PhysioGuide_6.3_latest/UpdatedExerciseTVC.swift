//
//  UpdatedExerciseTVC.swift
//  PhysioGuide_7
//
//  Created by Arlene、 on 2015-11-26.
//  Copyright © 2015 Team STAR. All rights reserved.
//

import UIKit

class UpdatedExerciseTVC: UITableViewCell {
    
    //MARK Properties
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var checkmark: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
