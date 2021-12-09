//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ProgressText: UILabel!
    @IBOutlet weak var ProgressBar: UIProgressView!
    var secondsRemaining:Float = 0
    var initialTiming:Float = 0
    var timer = Timer()
    @IBAction func ButtonPress(_ sender: UIButton) {
        timer.invalidate()
        let eggTimes:[String:Int] = ["Soft":5,"Medium":7,"Hard":12]
        initialTiming = Float(eggTimes[sender.currentTitle!]!)
        secondsRemaining = Float(eggTimes[sender.currentTitle!]!)
       
        if sender.currentTitle != nil {
            ProgressText.text = "Timer started!"
            ProgressBar.progress = 0
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        }
       
       
    }
    @objc func updateCounter() {
        //example functionality
        if secondsRemaining > 0 {
            ProgressBar.progress = (initialTiming - secondsRemaining)/initialTiming
            secondsRemaining -= 1
        }
        else{
            ProgressBar.progress = 1
            timer.invalidate()
            ProgressText.text = "Done"
        }
    }
}
