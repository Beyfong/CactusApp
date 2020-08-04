//
//  Session.swift
//  Kaktus
//
//  Created by ablai erzhanov on 7/29/20.
//  Copyright © 2020 ablai erzhanov. All rights reserved.
//

import Foundation


class Session {
    let durationInSeconds: Int
    let startDate: Date
    
    init(durationInSeconds:Int, startDate: Date){
        self.durationInSeconds = durationInSeconds
        self.startDate = startDate
    }
}

 
 
