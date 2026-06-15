import SwiftUI

class ThemeViewModel: ObservableObject {
    @Published var isDarkMode: Bool

    init(deviceMode: UIUserInterfaceStyle) {
        do {
            isDarkMode = try ThemeDataStore.getStoredIsDarkMode()
        } catch {
            isDarkMode = UserInterfaceChecker.isModeDark(mode: deviceMode)
        }
    }

    func toggleMode() {
        isDarkMode.toggle()

        ThemeDataStore.setStoredIsDarkMode(isDarkMode: isDarkMode)
    }
}
