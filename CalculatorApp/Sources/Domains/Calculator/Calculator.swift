import Darwin

class Calculator {
    private(set) var expression: String

    init(expression: String) {
        self.expression = expression
    }

    func addCharacter(character: Character) {
        expression += character.rawValue
    }

    func backspace() {
        expression = CalculatorFormatter.getCalculationExpressionWithoutLastCharacter(
            expression: expression)
    }

    func clean() {
        expression = ""
    }

    func evaluate() throws {
        do {
            expression = try ExpressionEvaluator.getEvaluatedExpression(expression: expression)
        } catch {
            expression = ""

            throw error
        }
    }
}
