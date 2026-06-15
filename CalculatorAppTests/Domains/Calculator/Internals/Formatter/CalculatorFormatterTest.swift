import XCTest

@testable import CalculatorApp

final class CalculatorFormatterTest: XCTestCase {
    func
        testIfMethodGetCalculationExpressionWithoutLastCharacterReturnsCalculationExpressionWithoutLastCharacter()
    {
        let calculationExpressionWithoutLastCharacter =
            CalculatorFormatter.getCalculationExpressionWithoutLastCharacter(
                expression: EXPRESSION_TO_BE_EVALUATED)

        XCTAssertEqual(
            calculationExpressionWithoutLastCharacter,
            EXPRESSION_WITHOUT_LAST_CHARACTER
        )
    }
}
