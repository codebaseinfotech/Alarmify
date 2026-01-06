//
//  MathEquationsTblViewCell.swift
//  Alarmify
//
//  Created by iMac on 06/01/26.
//

import UIKit

class MathEquationsTblViewCell: UITableViewCell {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var equationsLabel: UILabel!
    @IBOutlet weak var optionView: UIView!
    @IBOutlet weak var optionDropDownButton: UIButton!
    @IBOutlet weak var answerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
