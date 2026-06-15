import XCTest

@testable import CalculatorApp

class ThemeViewModelFactoryTest: XCTestCase {
    override func setUp() async throws {
        if let bundleID = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundleID)

            UserDefaults.standard.synchronize()
        }
    }

    func testIfMethodGetInstanceReturnsAnInstance() throws {
        let instance = ThemeViewModelFactory.getInstance(deviceMode: .light)

        XCTAssertFalse(instance.isDarkMode)
    }
}
