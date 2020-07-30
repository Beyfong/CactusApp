//
//  BreakManagerDelegate.swift
//  Kaktus
//
//  Created by ablai erzhanov on 7/29/20.
//  Copyright © 2020 ablai erzhanov. All rights reserved.
//

import Foundation


protocol BreakManagerDelegate{
    func showBreakStarted()
    func showTimeLeft(secondsLeft: Int)
    func showBreakEnded()
    func showBreakCancelled( )
    
}

class BreakManager{
    var breakDelegate:BreakManagerDelegate
    var timer:Timer?
    
    
    init(breakDelegate: BreakManagerDelegate){
        self.breakDelegate=breakDelegate
    }
    
    func startBreak(theBreak:Break){
        breakDelegate.showBreakStarted()
        breakDelegate.showTimeLeft(secondsLeft:theBreak.durationInSeconds)
        
        var secondsLeft=theBreak.durationInSeconds
        timer=Timer.scheduledTimer(withTimeInterval: 1, repeats: true)  { _ in
            secondsLeft-=1
            self.breakDelegate.showTimeLeft(secondsLeft:secondsLeft)
            
            if secondsLeft==0{
                 
                self.breakDelegate.showBreakEnded()
                
                self.timer?.invalidate()
                self.timer=nil
            }
             
        }
}
    func CancellBreak(){
         
        self.breakDelegate.showBreakEnded()
        self.timer?.invalidate()
        self.timer=nil

    }
}

