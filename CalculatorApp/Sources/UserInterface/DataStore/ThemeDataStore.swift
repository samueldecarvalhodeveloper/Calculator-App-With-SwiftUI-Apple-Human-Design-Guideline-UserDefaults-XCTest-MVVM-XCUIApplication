import SwiftUI

class ThemeDataStore {
    private init() {}

    static func getStoredIsDarkMode() throws -> Bool {
        guard
            let storedApplicationMode = UserDefaults.standard.object(
                forKey: IS_DARK_MODE_KEY
            ) as? Bool
        else {
            throw UserInterfaceErrors.notInitializedTheme
        }

        return storedApplicationMode
    }

    static func setStoredIsDarkMode(isDarkMode: Bool) {
        UserDefaults.standard.set(isDarkMode, forKey: IS_DARK_MODE_KEY)
    }
}
