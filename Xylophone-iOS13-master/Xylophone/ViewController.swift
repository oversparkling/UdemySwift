//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

import AVFoundation

var player: AVAudioPlayer?



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

 
    @IBAction func keyPresed(_ sender: UIButton) {
        print(sender.currentTitle)
        playSound(name: sender.currentTitle!)
        sender.alpha = 0.5;
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Change `2.0` to the desired number of seconds.
            sender.alpha = 1;
        }
    }
    
    func playSound(name: String) {
            let url = Bundle.main.url(forResource: name, withExtension: "wav")
            player = try! AVAudioPlayer(contentsOf: url!)
            player!.play()    }
}

