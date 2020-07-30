//
//  MakeBreakControllerViewController.swift
//  Kaktus
//
//  Created by ablai erzhanov on 7/29/20.
//  Copyright © 2020 ablai erzhanov. All rights reserved.
//

import UIKit

class MakeBreakControllerViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate, BreakManagerDelegate {
     
     
    
    
    
    
    @IBOutlet var BreakViewImage: UIImageView!
     
    @IBOutlet var BreakButtonView: UIButton!
    
    @IBOutlet var pickerView: UIPickerView!
    
    @IBOutlet var countLableView: UILabel!
    
    @IBOutlet var finishBreakButton: UIButton!
    
    lazy var breakManager = BreakManager(breakDelegate : self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BreakViewImage.layer.cornerRadius = BreakViewImage.frame.width / 2
        BreakViewImage.layer.masksToBounds = true
        
        BreakButtonView.layer.cornerRadius = 14
        BreakButtonView.layer.masksToBounds = true
        
        finishBreakButton.layer.cornerRadius = 14
        finishBreakButton.layer.masksToBounds = true
        finishBreakButton.layer.borderWidth = 1
        finishBreakButton.layer.borderColor = UIColor(named: "Dark grey")?.cgColor
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        // Do any additional setup after loading the view.
    }
     
    @IBAction func didTapBreakButton() {
         
        let selectedPickerRow = pickerView.selectedRow(inComponent: 0)
        let selectedDuration = durations[selectedPickerRow]
        let theBreak = Break(durationInSeconds: selectedDuration)
        breakManager.startBreak(theBreak: theBreak)
    }
    
    @IBAction func didTapCloseButton() {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    @IBAction func didTapFinishBreakButton() {
        breakManager.CancellBreak()
    }
    
    let durations = [5,10,15,20,25,30]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return durations.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(durations[row]) mins"
    }
    
    func showBreakStarted() {
        pickerView.isHidden=true
        BreakButtonView.isHidden=true
        countLableView.isHidden=false
        finishBreakButton.isHidden=false
        print("break started")
    }
    
    func showTimeLeft(secondsLeft: Int) {
        countLableView.text = String(format: "%02d:%02d", secondsLeft/60 , secondsLeft%60)
    }
    
    func showBreakCancelled() {
        pickerView.isHidden=false
        BreakButtonView.isHidden=false
        countLableView.isHidden=true
        finishBreakButton.isHidden=true
    }

    func showBreakEnded() {
        pickerView.isHidden=false
        BreakButtonView.isHidden=false
        countLableView.isHidden=true
        finishBreakButton.isHidden=true
         
    }
    
    
}
