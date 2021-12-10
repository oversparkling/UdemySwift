//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ProgressBar: UIProgressView!
    
    @IBOutlet weak var FirstOptionButton: UIButton!
    @IBOutlet weak var SecondOptionButton: UIButton!
    @IBOutlet weak var ThirdOptionButton: UIButton!
    @IBOutlet weak var QuestionText: UILabel!
    
    @IBOutlet weak var ScoreLabel: UILabel!
    var quizBrain = QuizBrain()
    
    
    var timer = Timer()
    
    @IBOutlet weak var questionProgress: UIProgressView!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func AnswerButtonPressed(_ sender: UIButton) {
        let userAnswer  = sender.currentTitle!
        
        if (quizBrain.checkAnswer(userAnswer)){
            sender.backgroundColor = UIColor.green
        }
        else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.incrementQuestionNumber()
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
//            updateUI()
    }
    
    @objc func updateUI(){
        QuestionText.text = quizBrain.getQuestionText()
        FirstOptionButton.backgroundColor = UIColor.clear
        FirstOptionButton.setTitle(quizBrain.getFirstOption(), for: .normal)
        SecondOptionButton.backgroundColor = UIColor.clear
        SecondOptionButton.setTitle(quizBrain.getSecondOption(), for: .normal)
        ThirdOptionButton.backgroundColor = UIColor.clear
        ThirdOptionButton.setTitle(quizBrain.getThirdOption(), for: .normal)
        questionProgress.progress = quizBrain.getProgress()
        ScoreLabel.text = "Score: \(quizBrain.score)"
        
    }
    
}

