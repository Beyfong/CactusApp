//
//  SessionManagerDelegate.swift
//  Kaktus
//
//  Created by ablai erzhanov on 7/29/20.
//  Copyright © 2020 ablai erzhanov. All rights reserved.
//

import Foundation

protocol SessionManagerDelegate{
    func showSessionStarted( )
    func showTimeLeft(secondsLeft: Int)
    func showSessionEnded( )
    func showSessionCancelled( )
          }

class SessionManager{
    var Delegate:SessionManagerDelegate
    var timer:Timer?
     
    
    init(sessionDelegate: SessionManagerDelegate){
        self.Delegate=sessionDelegate
    }
    
    func startSession(session:Session){
         Delegate.showSessionStarted( )
         Delegate.showTimeLeft(secondsLeft:session.durationInSeconds)
        
        var secondsLeft=session.durationInSeconds
        timer=Timer.scheduledTimer(withTimeInterval: 1, repeats: true)  { _ in
            secondsLeft-=1
            self.Delegate.showTimeLeft(secondsLeft:secondsLeft)
            
            if secondsLeft==0{
                
                self.Delegate.showSessionEnded( )
                
                self.timer?.invalidate()
                self.timer=nil
            }
             
        }
}
    func CancellSession( ){
         
        self.Delegate.showSessionEnded( )
        self.timer?.invalidate()
        self.timer=nil

    }
}
