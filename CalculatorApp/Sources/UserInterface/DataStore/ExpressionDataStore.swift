import SwiftUI

class ExpressionDataStore {
    private init() {}

    static func getStoredExpression() throws -> String {
        guard
            let storedExpression = UserDefaults.standard.object(
                forKey: EXPRESSION_KEY
            ) as? String
        else {
            throw UserInterfaceErrors.notInitializedExpression
        }

        return storedExpression
    }

    static func setExpression(expression: String) {
        UserDefaults.standard.set(expression, forKey: EXPRESSION_KEY)
    }
}
