//  TipCalculator.swift
//  Boot_TDD_TipCalculator
import Foundation

enum TipCalculatorError: Error, CustomStringConvertible {
    case invalidInput
    
    var description: String {
        switch self {
        case .invalidInput:  "Invalid input"
        }
    }
}


class TipCalculator {
    
    func calculate(total: Double, tipPercent: Double) throws -> Double {
        if total < 0 {
            throw TipCalculatorError.invalidInput
        }
        return total * tipPercent
    }
}
