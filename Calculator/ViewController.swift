//
//  ViewController.swift
//  Calculator
//
//  Created by Иван on 12/21/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayResultLabel: UILabel!
    
    var stillTyping = false
    
    var firstOperand : Double = 0
    var secondOperand : Double = 0
    var operationSign = ""
    
    var currentInput : Double {
        get {
            return Double(displayResultLabel.text!)!
        }
        set {
            displayResultLabel.text = "\(newValue)"
            stillTyping = false
        }
    }
    
    var dotIsPlaced = false
   
    @IBAction func numberPressed(_ sender: UIButton) {
        let number = sender.currentTitle!
        if stillTyping {
            if displayResultLabel.text!.count < 20 {
                displayResultLabel.text = displayResultLabel.text! + number
                print("true")
            } else {
                displayResultLabel.text = number
                stillTyping = true
                print("false")
            }
        }
    }
    
    @IBAction func twoOperandsSignPressed(_ sender: UIButton) {
        operationSign = sender.currentTitle!
        firstOperand = currentInput
        stillTyping = false
    }
    
    func operateWithTwoOperands(operation: (Double, Double) -> Double) {
        currentInput = operation(firstOperand, secondOperand)
        stillTyping = false
    }
    
    @IBAction func equalitySignPressed(_ sender: UIButton) {
        if stillTyping {
            secondOperand = currentInput
        }
        
        switch operationSign {
        case "+": operateWithTwoOperands {$0 + $1}
        case "-": operateWithTwoOperands {$0 - $1}
        case "×": operateWithTwoOperands {$0 * $1}
        case "÷": operateWithTwoOperands {$0 / $1}
        default: break
        }
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        firstOperand = 0
        secondOperand = 0
        currentInput = 0
        displayResultLabel.text = "0"
        stillTyping = false
        operationSign = ""
    }
    
    @IBAction func plusMinusButtonPressed(_ sender: UIButton) {
        currentInput = -currentInput
    }
    @IBAction func percentagesButtonPressed(_ sender: UIButton) {
        if firstOperand == 0 {
            currentInput = currentInput / 100
        } else {
            secondOperand = firstOperand / currentInput * 100
        }
    }
    
    @IBAction func squareRootButtonPressed(_ sender: UIButton) {
        currentInput = sqrt(currentInput)
    }
    @IBAction func dotButtonPressed(_ sender: UIButton) {
        if stillTyping && !dotIsPlaced {
            
        }
    }
    
}

