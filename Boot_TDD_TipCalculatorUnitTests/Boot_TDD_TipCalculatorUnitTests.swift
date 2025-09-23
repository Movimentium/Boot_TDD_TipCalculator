//  Boot_TDD_TipCalculatorUnitTests.swift
//  Boot_TDD_TipCalculatorUnitTests
import XCTest

// The name of the class defines the context of the test
final class When_calculating_tip_based_on_total_amount: XCTestCase {

    func test_should_calculate_tip_succesfully() {
        let tipCalculator = TipCalculator()
        let tip = tipCalculator.calculate(total: 100, tipPercent: 0.1)
        XCTAssertEqual(10, tip)
    }

}

// A new Case, a new context
final class When_calculating_tip_based_on_negative_total_amout: XCTestCase {
    
    func test_should_throw_invalid_input_exception() {
        
    }
    
}
