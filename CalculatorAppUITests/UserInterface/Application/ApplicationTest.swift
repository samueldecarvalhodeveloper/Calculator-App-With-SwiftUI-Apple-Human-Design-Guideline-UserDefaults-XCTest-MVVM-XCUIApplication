import XCTest

@testable import CalculatorApp

class ApplicationTest: UserInterfaceTestSetup {
    func testIfApplicationIsSet() {
        XCTAssertNotNil(application?.buttons[TOOLBAR_TOGGLE_MODE_BUTTON_ACCESSIBILITY_IDENTIFIER])
    }
}
