//
//  CompanyTBCell.swift
//  MVVM_Demo
//
//  Created by Appzgate Solutions on 8/12/22.
//

import UIKit

class CompanyTBCell: UITableViewCell {
    @IBOutlet weak var companyNameLabel : UILabel!
    @IBOutlet weak var companyFounderLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(_ company : Company){
        self.companyNameLabel.text = company.company_name
        self.companyFounderLabel.text = company.company_founder
    }

}
