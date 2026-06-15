import SwiftUI

class ThemeViewModelFactory {
    private init() {}

    static func getInstance(deviceMode: UIUserInterfaceStyle) -> ThemeViewModel {
        return ThemeViewModel(deviceMode: deviceMode)
    }
}
