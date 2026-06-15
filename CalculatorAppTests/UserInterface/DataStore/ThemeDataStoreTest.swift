import XCTest

class ThemeDataStoreTest: XCTestCase {
    override func setUp() {
        super.setUp()

        if let bundleID = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundleID)

            UserDefaults.standard.synchronize()
        }
    }

    func testIfMethodGetStoredIsDarkModeReturnsStoredIsThemeDark() throws {
        UserDefaults.standard.set(true, forKey: IS_DARK_MODE_KEY)

        let storedIsThemeDark = try ThemeDataStore.getStoredIsDarkMode()

        XCTAssertTrue(storedIsThemeDark)
    }

    func testIfMethodGetStoredIsThemeDarkThrowsNotInitializedThemeErrorIfThemeIsNotInitialized() {
        do {
            let _ = try ThemeDataStore.getStoredIsDarkMode()
        } catch {
            XCTAssertNotNil(error)
        }
    }

    func testIfMethodSetStoredIsDarkModeSetsIsThemeDarkInKeyValuedDatabase() {
        ThemeDataStore.setStoredIsDarkMode(isDarkMode: true)

        let storedIsThemeDark = UserDefaults.standard.bool(forKey: IS_DARK_MODE_KEY)

        XCTAssertTrue(storedIsThemeDark)
    }
}
