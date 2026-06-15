import SwiftUI
import XCTest

@testable import CalculatorApp

class CalculatorViewfinderTest: XCTestCase {
    func testViewIsBuilt() throws {
        let valueBinding = Binding.constant(EXPRESSION_TO_BE_EVALUATED)
        let view = CalculatorViewfinder(screenHeight: SMALL_SCREEN_HEIGHT, value: valueBinding)

        XCTAssertEqual(view.value, EXPRESSION_TO_BE_EVALUATED)
    }
}
