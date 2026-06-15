import XCTest

@testable import CalculatorApp

final class CalculatorTest: XCTestCase {
    var calculator: Calculator!

    override func setUp() {
        super.setUp()

        calculator = Calculator(expression: "")
    }

    func testIfMethodAddCharacterAddsChosenCharacterToExpression() {
        calculator.addCharacter(character: Character.ONE)

        XCTAssertEqual(calculator.expression, Character.ONE.rawValue)
    }

    func testIfMethodBackspaceRemovesLastCharacterOfExpression() {
        calculator = Calculator(expression: EXPRESSION_TO_BE_EVALUATED)

        calculator.backspace()

        XCTAssertEqual(calculator.expression, EXPRESSION_WITHOUT_LAST_CHARACTER)
    }

    func testIfMethodCleanRemovesAllCharacterFromExpression() {
        calculator = Calculator(expression: EXPRESSION_TO_BE_EVALUATED)

        calculator.clean()

        XCTAssertEqual(calculator.expression, "")
    }

    func testIfMethodEvaluateEvaluatesExpression() throws {
        calculator = Calculator(expression: EXPRESSION_TO_BE_EVALUATED)

        try calculator.evaluate()

        XCTAssertEqual(calculator.expression, EVALUATED_EXPRESSION)
    }

    func testIfMethodEvaluateThrowsNotValidExpressionIfExpressionIsNotValid() throws {
        calculator = Calculator(expression: EXPRESSION_TO_BE_EVALUATED)

        do {
            try calculator.evaluate()
        } catch {
            XCTAssertNotNil(error)
        }
    }
}
