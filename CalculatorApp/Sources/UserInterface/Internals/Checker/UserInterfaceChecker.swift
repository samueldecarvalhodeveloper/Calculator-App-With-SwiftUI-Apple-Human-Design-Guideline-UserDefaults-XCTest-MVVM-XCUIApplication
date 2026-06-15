import SwiftUI

class UserInterfaceChecker {
    private init() {}

    static func isScreenHeightSmall(screenHeight: CGFloat) -> Bool {
        return screenHeight < SMALL_SCREEN_HEIGHT
    }

    static func isModeDark(mode: UIUserInterfaceStyle) -> Bool {
        return mode == .dark
    }
}
