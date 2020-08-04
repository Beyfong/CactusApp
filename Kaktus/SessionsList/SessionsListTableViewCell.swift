//
//  SessionsListTableViewCell.swift
//  Kaktus
//
//  Created by ablai erzhanov on 8/3/20.
//  Copyright © 2020 ablai erzhanov. All rights reserved.
//

import UIKit

class SessionsListTableViewCell: UITableViewCell {
    @IBOutlet var cactusimageView: UIImageView!
    @IBOutlet var startDateLable: UILabel!
    @IBOutlet var durationLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(with session: Session){
        let hoursCount = session.durationInSeconds/60
        let minutesCount = session.durationInSeconds%60
        var durationText: String!
        if hoursCount == 0{
                durationText = " \(minutesCount)m"
        }else if minutesCount == 0{
                durationText = "\(hoursCount)h"
        }else{
                durationText = "\(hoursCount)h\(minutesCount)m"
        }
       
        durationLable.text = durationText
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        let startDateText = "\( dateFormatter.string(from: session.startDate ))"
        startDateLable.text = startDateText
        
    }

     

}
