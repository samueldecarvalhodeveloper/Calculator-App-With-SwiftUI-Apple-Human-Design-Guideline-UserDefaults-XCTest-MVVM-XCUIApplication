import XCTest

class UserInterfaceTestSetup: XCTestCase {
    var application: XCUIApplication?

    @MainActor
    override func setUp() async throws {
        try await super.setUp()

        if let bundleID = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundleID)

            UserDefaults.standard.synchronize()
        }

        self.continueAfterFailure = false

        application = XCUIApplication()

        application?.launchArguments.append(IS_DARK_MODE_FORCED)
        application?.launchArguments.append(IS_EMPTY_CALCULATION_EXPRESSION_FORCED)

        application!.launch()
    }
}
