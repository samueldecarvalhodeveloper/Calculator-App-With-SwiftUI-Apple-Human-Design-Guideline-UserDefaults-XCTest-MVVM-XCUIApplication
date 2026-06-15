import XCTest

@testable import CalculatorApp

class ContentViewTest: UserInterfaceTestSetup {
    func testIfContentIsShown() {
        XCTAssertNotNil(application?.buttons[TOOLBAR_TOGGLE_MODE_BUTTON_ACCESSIBILITY_IDENTIFIER])
    }
}
