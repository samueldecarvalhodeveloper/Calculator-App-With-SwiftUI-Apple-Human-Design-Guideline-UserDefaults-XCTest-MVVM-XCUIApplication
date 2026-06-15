import XCTest

@testable import CalculatorApp

final class ExpressionEvaluatorTest: XCTestCase {
    func testIfMethodGetEvaluatedExpressionReturnsEvaluatedExpression() throws {
        let evaluatedExpression = try ExpressionEvaluator.getEvaluatedExpression(
            expression: EXPRESSION_TO_BE_EVALUATED)

        XCTAssertEqual(evaluatedExpression, EVALUATED_EXPRESSION)
    }

    func
        testIfMethodGetEvaluatedExpressionThrowsNotValidExpressionErrorOnNotValidExpression()
    {
        do {
            _ = try ExpressionEvaluator.getEvaluatedExpression(
                expression: Character.ADDITION.rawValue)
        } catch {
            XCTAssertNotNil(error)
        }

        do {
            _ = try ExpressionEvaluator.getEvaluatedExpression(
                expression: Character.ZERO.rawValue + Character.DIVISION.rawValue
                    + Character.ZERO.rawValue)
        } catch {
            XCTAssertNotNil(error)
        }

        do {
            _ = try ExpressionEvaluator.getEvaluatedExpression(
                expression: Character.ONE.rawValue + Character.DIVISION.rawValue
                    + Character.ZERO.rawValue)
        } catch {
            XCTAssertNotNil(error)
        }
    }
}
