//
//  SoundListTVCell.swift
//  Alarmify
//
//  Created by Ankit on 06/01/26.
//

import UIKit

class SoundListTVCell: UITableViewCell {

    @IBOutlet weak var selectImageView: UIImageView!
    @IBOutlet weak var ringNameLabel: UILabel!
    @IBOutlet weak var playSoundImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
