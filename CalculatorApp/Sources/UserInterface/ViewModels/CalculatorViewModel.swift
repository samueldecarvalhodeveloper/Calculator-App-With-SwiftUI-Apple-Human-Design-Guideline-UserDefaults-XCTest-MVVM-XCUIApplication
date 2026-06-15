import SwiftUI

class CalculatorViewModel: ObservableObject {
    @Published var expression: String
    private let calculator: Calculator

    init(calculator: Calculator) {
        self.calculator = calculator

        self.expression = calculator.expression
    }

    func addCharacter(character: Character) {
        calculator.addCharacter(character: character)

        expression = calculator.expression

        ExpressionDataStore.setExpression(expression: calculator.expression)
    }

    func backspace() {
        calculator.backspace()

        expression = calculator.expression

        ExpressionDataStore.setExpression(expression: calculator.expression)
    }

    func clean() {
        calculator.clean()

        expression = calculator.expression

        ExpressionDataStore.setExpression(expression: calculator.expression)
    }

    func evaluate() {
        do {
            try calculator.evaluate()

            expression = calculator.expression
        } catch {
            expression = INTERNATIONAL_NOT_VALID_EXPRESSION_MESSAGE
        }

        ExpressionDataStore.setExpression(expression: calculator.expression)
    }
}
