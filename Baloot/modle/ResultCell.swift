//
//  ResultCell.swift
//  Baloot
//
//  Created by Mohammed Alsayed on 30/05/1443 AH.
//

import UIKit

class ResultCell: UITableViewCell {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        

        
    }
    func configure(score:Score) {
            label2.text = "\(score.lahm)"
            label1.text = "\(score.lana)"
        }
}
