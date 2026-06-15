import XCTest

@testable import CalculatorApp

class CalculatorScreenTest: UserInterfaceTestSetup {
    func testIfCalculationButtonsManpulatesExpression() {
        var viewfinderValueElement: XCUIElement?

        application?.staticTexts[CalculatorCharacter.ZERO.rawValue].tap()
        application?.staticTexts[CalculatorCharacter.ONE.rawValue].tap()
        application?.staticTexts[CalculatorCharacter.TWO.rawValue].tap()
        application?.staticTexts[CalculatorCharacter.THREE.rawValue].tap()
        application?.staticTexts[CalculatorCharacter.FOUR.rawValue].tap()
        application?.staticTexts[CalculatorCharacter.FIVE.rawValue].tap()
        application?.staticTexts[CalculatorCharacter.SIX.rawValue].tap()
        application?.staticTexts[CalculatorCharacter.SEVEN.rawValue].tap()
        application?.staticTexts[CalculatorCharacter.EIGHT.rawValue].tap()
        application?.staticTexts[CalculatorCharacter.NINE.rawValue].tap()

        viewfinderValueElement =
            application?.staticTexts[CALCULATOR_VIEWFINDER_VALUE_TEXT_ACCESSIBILITY_IDENTIFIER]

        XCTAssertEqual(
            viewfinderValueElement!.label,
            CalculatorCharacter.ZERO.rawValue + CalculatorCharacter.ONE.rawValue
                + CalculatorCharacter.TWO.rawValue + CalculatorCharacter.THREE.rawValue
                + CalculatorCharacter.FOUR.rawValue + CalculatorCharacter.FIVE.rawValue
                + CalculatorCharacter.SIX.rawValue + CalculatorCharacter.SEVEN.rawValue
                + CalculatorCharacter.EIGHT.rawValue + CalculatorCharacter.NINE.rawValue
        )

        application?.staticTexts[CalculatorCharacter.CLEAN.rawValue].tap()

        XCTAssertEqual(viewfinderValueElement!.label, "")

        application?.staticTexts[CalculatorCharacter.POINT.rawValue].tap()

        XCTAssertEqual(
            viewfinderValueElement?.label,
            CalculatorCharacter.POINT.rawValue
        )

        application?.staticTexts[CalculatorCharacter.BACKSPACE.rawValue].tap()

        XCTAssertEqual(viewfinderValueElement!.label, "")

        application?.staticTexts[CalculatorCharacter.MULTIPLICATION.rawValue].tap()
        application?.staticTexts[CalculatorCharacter.SUBTRACTION.rawValue].tap()
        application?.staticTexts[CalculatorCharacter.ADDITION.rawValue].tap()
        application?.staticTexts[CalculatorCharacter.DIVISION.rawValue].tap()

        XCTAssertEqual(
            viewfinderValueElement?.label,
            CalculatorCharacter.MULTIPLICATION.rawValue + CalculatorCharacter.SUBTRACTION.rawValue
                + CalculatorCharacter.ADDITION.rawValue + CalculatorCharacter.DIVISION.rawValue
        )

        application?.staticTexts[CalculatorCharacter.EVALUATING.rawValue].tap()

        XCTAssertNotNil(viewfinderValueElement!.label)
    }

    func testIfToggleModeButtonDispatchesThemeToggling() {
        application?.buttons[TOOLBAR_TOGGLE_MODE_BUTTON_ACCESSIBILITY_IDENTIFIER].tap()

        XCTAssertNotNil(application?.images[DARK_MODE_ICON_NAME])
    }
}
