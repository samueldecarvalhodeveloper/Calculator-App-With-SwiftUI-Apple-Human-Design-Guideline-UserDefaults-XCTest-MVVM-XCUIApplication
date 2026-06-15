import XCTest

@testable import CalculatorApp

class CalculatorViewModelFactoryTest: XCTestCase {
    override func setUp() async throws {
        if let bundleID = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundleID)

            UserDefaults.standard.synchronize()
        }
    }

    func testIfMethodGetInstanceReturnsAnInstanceWithEmptyExpression() throws {
        let instance =
            CalculatorViewModelFactory.getInstance()

        XCTAssertEqual(instance.expression, "")
    }

    func testIfMethodGetInstanceReturnsAnInstanceWithStoredDataExpression() throws {
        ExpressionDataStore.setExpression(expression: EXPRESSION_TO_BE_EVALUATED)

        let instance =
            CalculatorViewModelFactory.getInstance()

        XCTAssertEqual(instance.expression, EXPRESSION_TO_BE_EVALUATED)
    }
}
