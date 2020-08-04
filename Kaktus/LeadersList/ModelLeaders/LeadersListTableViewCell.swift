//
//  LeadersListTableViewCell.swift
//  Kaktus
//
//  Created by ablai erzhanov on 8/3/20.
//  Copyright © 2020 ablai erzhanov. All rights reserved.
//

import UIKit

class LeadersListTableViewCell: UITableViewCell {

    
    @IBOutlet var positionLable: UILabel!
    
    @IBOutlet var hoursCountLable: UILabel!
    
     
    
    @IBOutlet var nameLable: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
    }

    
    func configure(with leader:Leader, position: Int){
        positionLable.text = "\(position)"
        nameLable.text = leader.name
        hoursCountLable.text = "\(leader.hoursCount)hr."
       
        if position<=3{
            positionLable.textColor = UIColor(named: "secondaryColor")
        }else{
            positionLable.textColor = UIColor(named: "lightGrey")
        }
        
    }

}
