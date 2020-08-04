//
//  SessionsStorage.swift
//  Kaktus
//
//  Created by ablai erzhanov on 8/3/20.
//  Copyright © 2020 ablai erzhanov. All rights reserved.
//

import Foundation


class SessionsStorage{
    static let shared = SessionsStorage()
    
    var sessions = [Session]()
    
    func addSession(_ session:Session){
        sessions.append(session)
    }
}
