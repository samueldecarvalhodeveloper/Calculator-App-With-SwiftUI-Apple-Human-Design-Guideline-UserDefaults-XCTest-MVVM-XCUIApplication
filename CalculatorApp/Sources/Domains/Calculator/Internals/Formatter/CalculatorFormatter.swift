class CalculatorFormatter {
    private init() {}

    static func getCalculationExpressionWithoutLastCharacter(expression: String) -> String {
        let expressionWithoutLastCharacter = expression.dropLast()

        return String(expressionWithoutLastCharacter)
    }
}
