//
//  UpdatedExerciseTableViewCell.swift
//  
//
//  Created by Arlene、 on 2015-11-25.
//
//

import UIKit

class UpdatedExerciseTableViewCell: UITableViewCell {

    //MARK : Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var checkItOut: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
