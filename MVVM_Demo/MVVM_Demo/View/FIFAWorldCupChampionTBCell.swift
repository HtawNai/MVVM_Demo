//
//  WorldCupChampionTBCell.swift
//  MVVM_Demo
//
//  Created by Appzgate Solutions on 8/19/22.
//

import UIKit

class FIFAWorldCupChampionTBCell: UITableViewCell {
    
    @IBOutlet weak var yearLabel : UILabel!
    @IBOutlet weak var championNameLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(champion: FIFAWorldCupChampion){
        yearLabel.text = "Year: \(champion.year)"
        championNameLabel.text = "Champion: \(champion.champion_team)"
    }

}
