import SwiftUI

@main
struct Application: App {
    @StateObject private var calculatorViewModel: CalculatorViewModel
    @StateObject private var themeViewModel: ThemeViewModel
    private var forcedThemeMode: ColorScheme?

    init() {
        let calculatorViewModel =
            CalculatorViewModelFactory.getInstance()
        let themeViewModel =
            ThemeViewModelFactory.getInstance(
                deviceMode: UIScreen.main.traitCollection.userInterfaceStyle)

        _calculatorViewModel = StateObject(wrappedValue: calculatorViewModel)
        _themeViewModel = StateObject(wrappedValue: themeViewModel)

        if ProcessInfo.processInfo.arguments.contains(IS_DARK_MODE_FORCED) {
            forcedThemeMode = .dark
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(themeViewModel)
                .environmentObject(calculatorViewModel)
                .preferredColorScheme(
                    forcedThemeMode ?? (themeViewModel.isDarkMode ? .dark : .light))
        }
    }
}
