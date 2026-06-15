import SwiftUI
import XCTest

@testable import CalculatorApp

class CalculatorButtonTest: XCTestCase {
    func testIfViewDispatchesItsAction() throws {
        var isButtonTapped = false

        let view = CalculatorButton(
            character: CalculatorCharacter.ADDITION,
            characterColor: OPERATOR_BUTTON_CHARACTER_COLOR,
            backgroundColor: OPERATOR_BUTTON_BACKGROUND_COLOR,
            screenHeight: SMALL_SCREEN_HEIGHT,
            onTap: {
                isButtonTapped = true
            }
        )

        view.onTap()

        XCTAssertTrue(isButtonTapped)
    }
}
