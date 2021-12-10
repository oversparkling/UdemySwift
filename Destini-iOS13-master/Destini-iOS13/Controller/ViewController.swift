//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain()
//    let example = Story(title: "You see a fork in the road", choice1: "Take a left", choice2: "Take a right")
    override func viewDidLoad() {
        super.viewDidLoad()
        storyLabel.text = storyBrain.storyArray[storyBrain.currentStoryIndex].title
        choice1Button.setTitle(storyBrain.storyArray[storyBrain.currentStoryIndex].choice1, for: .normal)
        choice2Button.setTitle(storyBrain.storyArray[storyBrain.currentStoryIndex].choice2, for: .normal)
    }
    
    
    @IBAction func ButtonPressed(_ sender: UIButton) {
        storyBrain.buttonClicked(sender.currentTitle!)
        updateUI()
    }
    
    
    func updateUI() {
        storyLabel.text = storyBrain.storyArray[storyBrain.currentStoryIndex].title
        choice1Button.setTitle(storyBrain.storyArray[storyBrain.currentStoryIndex].choice1, for: .normal)
        choice2Button.setTitle(storyBrain.storyArray[storyBrain.currentStoryIndex].choice2, for: .normal)
    }


}

