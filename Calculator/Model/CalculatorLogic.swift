//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Mayur Vaity on 15/05/24.
//  Copyright © 2024 London App Brewery. All rights reserved.
//

import Foundation

class CalculatorLogic {
    
    var number: Double
    
    init(number: Double) {
        self.number = number
    }
    
    func calculate(symbol: String) -> Double? {
        if symbol == "+/-" {
            return number * -1
        } else if symbol == "AC" {
            return 0
        } else if symbol == "%" {
            return number / 100.0
        }
        
        return nil
    }
    
}

