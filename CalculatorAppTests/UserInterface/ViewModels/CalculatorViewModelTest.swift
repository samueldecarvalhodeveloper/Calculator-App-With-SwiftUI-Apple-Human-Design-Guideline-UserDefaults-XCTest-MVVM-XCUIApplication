import XCTest

@testable import CalculatorApp

final class CalculatorViewModelTest: XCTestCase {
    var calculator: Calculator!
    var calculatorViewModel: CalculatorViewModel!

    override func setUp() {
        super.setUp()

        if let bundleID = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundleID)

            UserDefaults.standard.synchronize()
        }

        calculator = Calculator(expression: "")

        calculatorViewModel = CalculatorViewModel(calculator: calculator)
    }

    func
        testIfMethodAddCharacterAddsChosenCharacterOnCalculationExpressionAndStoresCalculationExpression()
    {
        calculatorViewModel.addCharacter(character: Character.ONE)

        let calculationExpressionFromKeyValueDatabase = UserDefaults.standard.string(
            forKey: EXPRESSION_KEY)!

        XCTAssertEqual(calculator.expression, Character.ONE.rawValue)
        XCTAssertEqual(calculatorViewModel.expression, Character.ONE.rawValue)
        XCTAssertEqual(calculationExpressionFromKeyValueDatabase, Character.ONE.rawValue)
    }

    func
        testIfMethodBackspaceRemovesLastCharacterOfCalculationExpressionAndStoresCalculationExpression()
    {
        calculator.addCharacter(character: Character.ONE)
        calculator.addCharacter(character: Character.ONE)

        calculatorViewModel.backspace()

        let calculationExpressionFromKeyValueDatabase = UserDefaults.standard.string(
            forKey: EXPRESSION_KEY)!

        XCTAssertEqual(calculator.expression, Character.ONE.rawValue)
        XCTAssertEqual(calculatorViewModel.expression, Character.ONE.rawValue)
        XCTAssertEqual(calculationExpressionFromKeyValueDatabase, Character.ONE.rawValue)
    }

    func
        testIfMethodCleanRemovesAllCharacterFromCalculationExpressionAndStoresCalculationExpression()
    {
        calculator.addCharacter(character: Character.ONE)
        calculator.addCharacter(character: Character.ONE)

        calculatorViewModel.clean()

        let calculationExpressionFromKeyValueDatabase = UserDefaults.standard.string(
            forKey: EXPRESSION_KEY)!

        XCTAssertEqual(calculator.expression, "")
        XCTAssertEqual(calculatorViewModel.expression, "")
        XCTAssertEqual(calculationExpressionFromKeyValueDatabase, "")
    }

    func testIfMethodEvaluateEvaluatesCalculationExpressionAndStoresCalculationExpression() {
        calculator.addCharacter(character: Character.ONE)
        calculator.addCharacter(character: Character.ADDITION)
        calculator.addCharacter(character: Character.ONE)

        calculatorViewModel.evaluate()

        let calculationExpressionFromKeyValueDatabase = UserDefaults.standard.string(
            forKey: EXPRESSION_KEY)!

        XCTAssertEqual(calculator.expression, Character.TWO.rawValue)
        XCTAssertEqual(calculatorViewModel.expression, Character.TWO.rawValue)
        XCTAssertEqual(calculationExpressionFromKeyValueDatabase, Character.TWO.rawValue)
    }

    func testIfMethodEvaluateTurnsNotValueExpressionMessageInDeviceLanguageIfExpressionIsNotValid()
    {
        calculator.addCharacter(character: Character.ONE)
        calculator.addCharacter(character: Character.ADDITION)

        calculatorViewModel.evaluate()

        XCTAssertEqual(calculatorViewModel.expression, INTERNATIONAL_NOT_VALID_EXPRESSION_MESSAGE)
    }
}
