//  Boot_TDD_TipCalculatorUITests.swift
//  Boot_TDD_TipCalculatorUITests
import XCTest

class when_content_view_is_shown: XCTestCase {

    func test_total_text_field_contains_default_value() {
        let app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
        
        let totalTextField = app.textFields["totalTextField"]
        
        XCTAssertEqual(totalTextField.value as! String, "Enter total")
    }
    
    func test_the_20_percent_default_tip_is_selected() {
        let app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
        
        let tipPicker = app.segmentedControls["tipPicker"]
        let pickerButton = tipPicker.buttons.element(boundBy: 1)
        
        XCTAssertEqual(pickerButton.label, "20%")
        XCTAssertEqual(pickerButton.isSelected, true)
    }
    
}
