import XCTest

@testable import CalculatorApp

final class ThemeViewModelTest: XCTestCase {
    var themeViewModel: ThemeViewModel!

    override func setUp() {
        super.setUp()

        if let bundleID = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundleID)

            UserDefaults.standard.synchronize()
        }

        themeViewModel = ThemeViewModel(deviceMode: .dark)
    }

    func testIfConstructorRestoresStoredApplicationThemeMode() {
        UserDefaults.standard.set(false, forKey: IS_DARK_MODE_KEY)

        themeViewModel = ThemeViewModel(deviceMode: .dark)

        XCTAssertFalse(themeViewModel.isDarkMode)
    }

    func testIfConstructorSetsThemeToDeviceThemeIfThereIsNotThemeModeStored() {
        themeViewModel = ThemeViewModel(deviceMode: .dark)

        XCTAssertTrue(themeViewModel.isDarkMode)
    }

    func testIfMethodToggleModeTogglesModeAndStoresIt() {
        let initialMode = themeViewModel.isDarkMode

        themeViewModel.toggleMode()

        XCTAssertNotEqual(themeViewModel.isDarkMode, initialMode)
    }
}
