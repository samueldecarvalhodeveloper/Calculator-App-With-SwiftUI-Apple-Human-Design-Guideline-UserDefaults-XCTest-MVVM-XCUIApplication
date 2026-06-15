import SwiftUI

struct CalculatorViewfinder: View {
    let screenHeight: CGFloat
    @Binding var value: String

    var body: some View {
        VStack(alignment: .trailing, spacing: 0) {
            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        Text(value)
                            .font(.system(size: 64, weight: .medium))
                            .frame(height: 77)
                            .accessibilityIdentifier(
                                CALCULATOR_VIEWFINDER_VALUE_TEXT_ACCESSIBILITY_IDENTIFIER)
                        Color.clear.frame(width: 1, height: 1).id(
                            CALCULATOR_VIEWFINDER_ENDING_ELEMENT_ID)
                    }
                    .flipsForRightToLeftLayoutDirection(true)
                    .environment(\.layoutDirection, .rightToLeft)
                }
                .flipsForRightToLeftLayoutDirection(true)
                .environment(\.layoutDirection, .rightToLeft)
                .padding(
                    EdgeInsets(
                        top: UserInterfaceChecker.isScreenHeightSmall(
                            screenHeight: screenHeight) ? 0 : 138,
                        leading: 16,
                        bottom: UserInterfaceChecker.isScreenHeightSmall(
                            screenHeight: screenHeight) ? 0 : 16,
                        trailing: 16
                    )
                )
                .onChange(of: value) { _ in
                    proxy.scrollTo(CALCULATOR_VIEWFINDER_ENDING_ELEMENT_ID)
                }
            }
            Divider()
                .background(EXPRESSION_VIEWFINDER_DIVIDER_COLOR)
        }
    }
}

struct CalculatorViewfinder_Previews: PreviewProvider {
    @State static var value = EXPRESSION_TO_BE_EVALUATED

    static var previews: some View {
        CalculatorViewfinder(screenHeight: SMALL_SCREEN_HEIGHT, value: $value)
            .previewLayout(.sizeThatFits)
    }
}
