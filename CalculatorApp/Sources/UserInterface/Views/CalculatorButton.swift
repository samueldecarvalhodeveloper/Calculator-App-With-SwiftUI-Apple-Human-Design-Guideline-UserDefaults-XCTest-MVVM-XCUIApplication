import SwiftUI

struct CalculatorButton: View {
    let character: CalculatorCharacter
    let characterColor: Color
    let backgroundColor: Color
    let screenHeight: CGFloat
    let onTap: () -> Void
    @State private var isTouchIndicatorShown: Bool = false

    var body: some View {
        VStack {
            ZStack {
                Text(character.rawValue)
                    .font(
                        .system(
                            size:
                                UserInterfaceChecker
                                .isScreenHeightSmall(screenHeight: screenHeight) ? 24 : 52,
                            weight: .medium)
                    )
                    .foregroundColor(characterColor)
                TOUCH_INDICATOR_COLOR
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .opacity(isTouchIndicatorShown ? 0.15 : 0)
                    .animation(.easeInOut, value: isTouchIndicatorShown)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(backgroundColor)
        .cornerRadius(
            UserInterfaceChecker.isScreenHeightSmall(screenHeight: screenHeight) ? 12 : 26
        )
        .clipped()
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    isTouchIndicatorShown = true
                }
                .onEnded { _ in
                    isTouchIndicatorShown = false

                    onTap()
                }
        )
    }
}

struct CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButton(
            character: CalculatorCharacter.ADDITION,
            characterColor: OPERATOR_BUTTON_CHARACTER_COLOR,
            backgroundColor: OPERATOR_BUTTON_BACKGROUND_COLOR,
            screenHeight: SMALL_SCREEN_HEIGHT,
            onTap: {}
        )
        .previewLayout(.sizeThatFits)
    }
}
