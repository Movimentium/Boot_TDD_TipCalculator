//  Boot_TDD_TipCalculatorUITests.swift
//  Boot_TDD_TipCalculatorUITests
import XCTest

class when_content_view_is_shown: XCTestCase {

    private var app: XCUIApplication!
    
    override func setUp() {         // Executed before each test
        app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
    }
    
    func test_total_text_field_contains_default_value() {
        
        let totalTextField = app.textFields["totalTextField"]
        
        XCTAssertEqual(totalTextField.value as! String, "Enter total")
    }
    
    func test_the_20_percent_default_tip_is_selected() {
        
        let tipPicker = app.segmentedControls["tipPicker"]
        let pickerButton = tipPicker.buttons.element(boundBy: 1)
        
        XCTAssertEqual(pickerButton.label, "20%")
        XCTAssertEqual(pickerButton.isSelected, true)
    }
    
    override class func tearDown() {   // Executed after each test
        // Clean up
    }
    
}

class when_calculate_tip_button_is_pressed_for_valid_input: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUp() {
        app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
        
        let totalTextField = app.textFields["totalTextField"]
        totalTextField.tap()
        totalTextField.typeText("100")
        
        let calculateTipButton = app.buttons["calculateTipButton"]
        calculateTipButton.tap()
    }
    
    func test_tip_is_displayed_on_screen() {
        let tipText = app.staticTexts["tipText"]
        let _ = tipText.waitForExistence(timeout: 0.5)
        
        XCTAssertTrue(!tipText.label.isEmpty)
        //XCTAssertEqual(tipText.label, "$20.00")
    }
        
}
