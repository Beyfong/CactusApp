//
//  ViewController.swift
//  Kaktus
//
//  Created by ablai erzhanov on 7/28/20.
//  Copyright © 2020 ablai erzhanov. All rights reserved.
//

import UIKit

class SessionViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate, SessionManagerDelegate {
     
    
     
    
 
     
    @IBOutlet var cactusImageView: UIImageView!
    
    @IBOutlet var cactusButtonView: UIButton!
    
    @IBOutlet var pickerView: UIPickerView!
    
    @IBOutlet var countLableView: UILabel!
    
    @IBOutlet var giveUpButton: UIButton!
    
    lazy var sessionManager=SessionManager(sessionDelegate:self)
    
    let durationInSeconds: Int = 0
    
     
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cactusImageView.layer.cornerRadius = cactusImageView.frame.width / 2
        cactusImageView.layer.masksToBounds = true
        
        cactusButtonView.layer.cornerRadius = 14
        cactusButtonView.layer.masksToBounds = true
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        giveUpButton.layer.cornerRadius = 14
        giveUpButton.layer.masksToBounds = true
        giveUpButton.layer.borderWidth = 1
        giveUpButton.layer.borderColor = UIColor(named: "Dark grey")?.cgColor
        
    }

    @IBAction func didTapPlantButton() {
         
        let selectedPickerRow=pickerView.selectedRow(inComponent: 0)
        let selectedDuration=durations[selectedPickerRow]
        sessionManager.startSession(session: Session(durationInSeconds: selectedDuration, startDate: Date()))//not a minutes
    }
    
    @IBAction func didGiveUpButton() {
        sessionManager.CancellSession()
    }
    
    
    let durations=[10,20,30,40,50,60,70,80,90,100,110,120]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return durations.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(durations[row]) mins"
    }
    
    func showSessionStarted( ) {
        
        countLableView.text = String(format: "%02d:%02d", durationInSeconds/60, durationInSeconds%60)
        cactusButtonView.isHidden = true
        pickerView.isHidden = true
        countLableView.isHidden = false
        giveUpButton.isHidden = false
        print("session started")
    }
    
    func showTimeLeft(secondsLeft: Int) {
        countLableView.text = String(format: "%02d:%02d", secondsLeft/60,secondsLeft%60)
    }
    
    func showSessionEnded( ) {
        performSegue(withIdentifier:  "ShowBreak", sender: nil)
        cactusButtonView.isHidden = false
        pickerView.isHidden = false
        countLableView.isHidden = true
        giveUpButton.isHidden = true
        print("session ended")
    }
    
    func showSessionCancelled( ) {
        cactusButtonView.isHidden = false
        pickerView.isHidden = false
        countLableView.isHidden = true
        giveUpButton.isHidden = true
        print("session cancelled")
    }

    
}

