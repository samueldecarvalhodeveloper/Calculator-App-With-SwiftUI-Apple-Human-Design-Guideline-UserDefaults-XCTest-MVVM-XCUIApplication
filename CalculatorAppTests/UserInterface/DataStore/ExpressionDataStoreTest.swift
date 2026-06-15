import XCTest

class ExpressionDataStoreTest: XCTestCase {
    override func setUp() {
        super.setUp()

        if let bundleID = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundleID)

            UserDefaults.standard.synchronize()
        }
    }

    func testIfMethodGetStoredExpressionReturnsStoredExpression() throws {
        UserDefaults.standard.set(EXPRESSION_TO_BE_EVALUATED, forKey: EXPRESSION_KEY)

        let storedExpression = try ExpressionDataStore.getStoredExpression()

        XCTAssertEqual(storedExpression, EXPRESSION_TO_BE_EVALUATED)
    }

    func testIfMethodGetStoredExpressionThrowsNotInitializedExpressionErrorIfThemeIsNotInitialized() {
        do {
            let _ = try ExpressionDataStore.getStoredExpression()
        } catch {
            XCTAssertNotNil(error)
        }
    }

    func testIfMethodSetStoredExpressionSetsExpressionInKeyValuedDatabase() {
        ExpressionDataStore.setExpression(expression: EXPRESSION_TO_BE_EVALUATED)

        let storedExpression = UserDefaults.standard.string(forKey: EXPRESSION_KEY)

        XCTAssertEqual(storedExpression, EXPRESSION_TO_BE_EVALUATED)
    }
}
