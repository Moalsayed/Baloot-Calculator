//
//  ScoreCell.swift
//  Baloot
//
//  Created by Mohammed Alsayed on 29/05/1443 AH.
//

import UIKit

class ScoreCell: UITableViewCell {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(score:Score) {
        label2.text = "\(score.lahm)"
        label1.text = "\(score.lana)"
}
}
