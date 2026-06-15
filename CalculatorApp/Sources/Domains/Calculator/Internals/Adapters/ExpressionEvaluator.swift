import Expression

class ExpressionEvaluator {
    private init() {}

    static func getEvaluatedExpression(expression: String) throws -> String {
        do {
            let evaluatedExpression =
                try Expression(expression).evaluate()

            if evaluatedExpression.isNaN || evaluatedExpression.isNaN {
                throw CalculatorErrors.notValidExpressionError
            }

            return evaluatedExpression.description.replacingOccurrences(
                of: ROUND_FLOATING_POINT_RESULT, with: "")
        } catch {
            throw CalculatorErrors.notValidExpressionError
        }
    }
}
