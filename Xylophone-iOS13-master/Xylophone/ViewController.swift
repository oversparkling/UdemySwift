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
    }
    
    func playSound(name: String) {
            let url = Bundle.main.url(forResource: name, withExtension: "wav")
            player = try! AVAudioPlayer(contentsOf: url!)
            player!.play()    }
}

