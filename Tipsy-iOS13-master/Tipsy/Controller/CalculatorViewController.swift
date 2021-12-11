//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var totalAmt = 123.56
    var amountToBePaidString = ""
    var tipAmt:Float = 0.1
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        if sender.title(for: .normal) == "0%"{
            tipAmt = 0.0
            zeroPctButton.isSelected = true
        }else if sender.title(for: .normal) == "10%"{
            tipAmt = 0.1
            tenPctButton.isSelected = true
        }
        else{
            tipAmt = 0.2
            twentyPctButton.isSelected = true
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
    
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        print(tipAmt)
        print(splitNumberLabel.text ?? "No value")
        let billAmt = (billTextField.text as! NSString).floatValue
        let amountToBePaid = billAmt * (1 + tipAmt) / (splitNumberLabel.text as! NSString).floatValue
        
        amountToBePaidString =  String(format: "%.2f", amountToBePaid)
        print(amountToBePaidString)
        self.performSegue(withIdentifier: "goToResults", sender: self)
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "goToResults"{
            
            var vcDestination = segue.destination as! ResultsViewController
            
            vcDestination.tipPct = String(format: "%.0f",tipAmt*100)
            vcDestination.numberOfPpl = splitNumberLabel.text
            vcDestination.totalAmt = amountToBePaidString
            
        }
    }


}

