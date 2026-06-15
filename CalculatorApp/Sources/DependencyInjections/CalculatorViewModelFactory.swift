class CalculatorViewModelFactory {
    private init() {}

    static func getInstance() -> CalculatorViewModel {
        let calculator: Calculator

        do {
            let storeExpression = try ExpressionDataStore.getStoredExpression()

            calculator = Calculator(expression: storeExpression)
        } catch {
            calculator = Calculator(expression: "")
        }

        return CalculatorViewModel(calculator: calculator)
    }
}
