//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        //getting the number from screen
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double.")
            }
            print("displayValue: \(number)")
            return number
        }
        set {
            //setting value on the screen when this variable gets updated
            displayLabel.text = String(newValue)
        }
    }
    
    //creating obj of CalculatorLogic class
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        
        //getting text from button pressed and performing related operation
        if let calcMethod = sender.currentTitle {
            //setting number value in the struct 
            calculator.setNumber(displayValue)
            
            //checking optional return if it is not nil
            if let result = calculator.calculate(symbol: calcMethod) {
                //assigning result value to displayValue
                displayValue = result
            }
        }
        
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                //to avoid multiple decimal points
                if numValue == "." {
                    
                    //checking if display value is an int or double
                    let isInt = floor(displayValue) == displayValue
                    //if it is not an int, need to return out of this method, to avoid adding another dot in the number
                    if !isInt {
                        return
                    }
                    
                }
                
                displayLabel.text = displayLabel.text! + numValue
            }
            
        }
        
    }

}

