//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var WeightLabel: UILabel!
    @IBOutlet weak var HeightValue: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightSliderValue: UISlider!
    
    @IBOutlet weak var weightSliderValue: UISlider!
    @IBAction func heightSlider(_ sender: UISlider) {
//        print(String(format: "%.2f",sender.value))
        HeightValue.text = "\(String(format: "%.2f",sender.value))m"
    }
    
    @IBAction func weightSlider(_ sender: UISlider) {
//        print(String(format: "%.0f",sender.value))
        WeightLabel.text = "\(String(format: "%.0f",sender.value))kg"
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSliderValue.value
        let weight = weightSliderValue.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        self.performSegue(withIdentifier: "goToResults", sender:self)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "goToResults"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.adviceValue  = calculatorBrain.getAdvice()
            destinationVC.colorValue = calculatorBrain.getColor()
        }
    }
}

