import XCTest

@testable import CalculatorApp

final class UserInterfaceCheckerTest: XCTestCase {
    func testIfMethodIsScreenHeightSmallReturnsTrueIfScreenHeightIsSmall() {
        let screenHeightIsSmall =
            UserInterfaceChecker.isScreenHeightSmall(screenHeight: SMALL_SCREEN_HEIGHT - 1)
        let screenHeightIsNotSmall =
            UserInterfaceChecker.isScreenHeightSmall(screenHeight: SMALL_SCREEN_HEIGHT)

        XCTAssertTrue(screenHeightIsSmall)
        XCTAssertFalse(screenHeightIsNotSmall)
    }

    func testIfMethodIsModeDarkReturnsTrueIfModeIsDark() {
        let modeIsDark = UserInterfaceChecker.isModeDark(mode: .dark)
        let modeIsNotDark = UserInterfaceChecker.isModeDark(mode: .light)

        XCTAssertTrue(modeIsDark)
        XCTAssertFalse(modeIsNotDark)
    }
}
