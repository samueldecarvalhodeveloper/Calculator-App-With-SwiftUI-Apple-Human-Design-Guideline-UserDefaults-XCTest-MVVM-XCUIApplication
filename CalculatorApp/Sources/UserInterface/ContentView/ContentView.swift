import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            CalculatorScreen()
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    @StateObject static private var calculatorViewModel = CalculatorViewModelFactory.getInstance()
    @StateObject static private var themeViewModel = ThemeViewModelFactory.getInstance(
        deviceMode: UIScreen.main.traitCollection.userInterfaceStyle
    )

    static var previews: some View {
        ContentView()
            .environmentObject(calculatorViewModel)
            .environmentObject(themeViewModel)
    }
}
