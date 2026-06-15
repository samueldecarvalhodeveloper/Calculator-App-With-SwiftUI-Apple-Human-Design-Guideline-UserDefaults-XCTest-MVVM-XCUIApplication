import SwiftUI

struct CalculatorScreen: View {
    @EnvironmentObject var calculatorViewModel: CalculatorViewModel
    @EnvironmentObject var themeViewModel: ThemeViewModel

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                CalculatorViewfinder(
                    screenHeight: geometry.size.height,
                    value: $calculatorViewModel.expression
                )
                Rectangle()
                    .fill(.clear)
                    .frame(
                        maxWidth: .infinity,
                        maxHeight:
                            UserInterfaceChecker
                            .isScreenHeightSmall(
                                screenHeight: geometry.size.height
                            ) ? 0 : 32
                    )
                GeometryReader { innerGeometry in
                    VStack(spacing: 8) {
                        HStack(spacing: 8) {
                            CalculatorButton(
                                character: CalculatorCharacter.CLEAN,
                                characterColor: ACTION_BUTTON_CHARACTER_COLOR,
                                backgroundColor: ACTION_BUTTON_BACKGROUND_COLOR,
                                screenHeight: geometry.size.height,
                                onTap: {
                                    calculatorViewModel.clean()
                                }
                            )
                            CalculatorButton(
                                character: CalculatorCharacter.DIVISION,
                                characterColor: OPERATOR_BUTTON_CHARACTER_COLOR,
                                backgroundColor: OPERATOR_BUTTON_BACKGROUND_COLOR,
                                screenHeight: geometry.size.height,
                                onTap: {
                                    calculatorViewModel.addCharacter(character: .DIVISION)
                                }
                            )
                            CalculatorButton(
                                character: CalculatorCharacter.MULTIPLICATION,
                                characterColor: OPERATOR_BUTTON_CHARACTER_COLOR,
                                backgroundColor: OPERATOR_BUTTON_BACKGROUND_COLOR,
                                screenHeight: geometry.size.height,
                                onTap: {
                                    calculatorViewModel.addCharacter(character: .MULTIPLICATION)
                                }
                            )
                            CalculatorButton(
                                character: CalculatorCharacter.BACKSPACE,
                                characterColor: ACTION_BUTTON_CHARACTER_COLOR,
                                backgroundColor: ACTION_BUTTON_BACKGROUND_COLOR,
                                screenHeight: geometry.size.height,
                                onTap: {
                                    calculatorViewModel.backspace()
                                }
                            )
                        }
                        HStack(spacing: 8) {
                            CalculatorButton(
                                character: CalculatorCharacter.SEVEN,
                                characterColor: NUMERICAL_BUTTON_CHARACTER_COLOR,
                                backgroundColor: .clear,
                                screenHeight: geometry.size.height,
                                onTap: {
                                    calculatorViewModel.addCharacter(character: .SEVEN)
                                }
                            )
                            CalculatorButton(
                                character: CalculatorCharacter.EIGHT,
                                characterColor: NUMERICAL_BUTTON_CHARACTER_COLOR,
                                backgroundColor: .clear,
                                screenHeight: geometry.size.height,
                                onTap: {
                                    calculatorViewModel.addCharacter(character: .EIGHT)
                                }
                            )
                            CalculatorButton(
                                character: CalculatorCharacter.NINE,
                                characterColor: NUMERICAL_BUTTON_CHARACTER_COLOR,
                                backgroundColor: .clear,
                                screenHeight: geometry.size.height,
                                onTap: {
                                    calculatorViewModel.addCharacter(character: .NINE)
                                }
                            )
                            CalculatorButton(
                                character: CalculatorCharacter.SUBTRACTION,
                                characterColor: OPERATOR_BUTTON_CHARACTER_COLOR,
                                backgroundColor: OPERATOR_BUTTON_BACKGROUND_COLOR,
                                screenHeight: geometry.size.height,
                                onTap: {
                                    calculatorViewModel.addCharacter(character: .SUBTRACTION)
                                }
                            )
                        }
                        HStack(spacing: 8) {
                            CalculatorButton(
                                character: CalculatorCharacter.FOUR,
                                characterColor: NUMERICAL_BUTTON_CHARACTER_COLOR,
                                backgroundColor: .clear,
                                screenHeight: geometry.size.height,
                                onTap: {
                                    calculatorViewModel.addCharacter(character: .FOUR)
                                }
                            )
                            CalculatorButton(
                                character: CalculatorCharacter.FIVE,
                                characterColor: NUMERICAL_BUTTON_CHARACTER_COLOR,
                                backgroundColor: .clear,
                                screenHeight: geometry.size.height,
                                onTap: {
                                    calculatorViewModel.addCharacter(character: .FIVE)
                                }
                            )
                            CalculatorButton(
                                character: CalculatorCharacter.SIX,
                                characterColor: NUMERICAL_BUTTON_CHARACTER_COLOR,
                                backgroundColor: .clear,
                                screenHeight: geometry.size.height,
                                onTap: {
                                    calculatorViewModel.addCharacter(character: .SIX)
                                }
                            )
                            CalculatorButton(
                                character: CalculatorCharacter.ADDITION,
                                characterColor: OPERATOR_BUTTON_CHARACTER_COLOR,
                                backgroundColor: OPERATOR_BUTTON_BACKGROUND_COLOR,
                                screenHeight: geometry.size.height,
                                onTap: {
                                    calculatorViewModel.addCharacter(character: .ADDITION)
                                }
                            )
                        }
                        HStack(spacing: 8) {
                            VStack(spacing: 8) {
                                HStack(spacing: 8) {
                                    CalculatorButton(
                                        character: CalculatorCharacter.ONE,
                                        characterColor: NUMERICAL_BUTTON_CHARACTER_COLOR,
                                        backgroundColor: .clear,
                                        screenHeight: geometry.size.height,
                                        onTap: {
                                            calculatorViewModel.addCharacter(character: .ONE)
                                        }
                                    )
                                    CalculatorButton(
                                        character: CalculatorCharacter.TWO,
                                        characterColor: NUMERICAL_BUTTON_CHARACTER_COLOR,
                                        backgroundColor: .clear,
                                        screenHeight: geometry.size.height,
                                        onTap: {
                                            calculatorViewModel.addCharacter(character: .TWO)
                                        }
                                    )
                                    CalculatorButton(
                                        character: CalculatorCharacter.THREE,
                                        characterColor: NUMERICAL_BUTTON_CHARACTER_COLOR,
                                        backgroundColor: .clear,
                                        screenHeight: geometry.size.height,
                                        onTap: {
                                            calculatorViewModel.addCharacter(character: .THREE)
                                        }
                                    )
                                }
                                HStack(spacing: 8) {
                                    CalculatorButton(
                                        character: CalculatorCharacter.ZERO,
                                        characterColor: NUMERICAL_BUTTON_CHARACTER_COLOR,
                                        backgroundColor: .clear,
                                        screenHeight: geometry.size.height,
                                        onTap: {
                                            calculatorViewModel.addCharacter(character: .ZERO)
                                        }
                                    )
                                    CalculatorButton(
                                        character: CalculatorCharacter.POINT,
                                        characterColor: OPERATOR_BUTTON_CHARACTER_COLOR,
                                        backgroundColor: OPERATOR_BUTTON_BACKGROUND_COLOR,
                                        screenHeight: geometry.size.height,
                                        onTap: {
                                            calculatorViewModel.addCharacter(character: .POINT)
                                        }
                                    ).frame(width: max(0, geometry.size.width / 4 - 8))
                                }
                            }
                            CalculatorButton(
                                character: CalculatorCharacter.EVALUATING,
                                characterColor: EVALUATING_BUTTON_CHARACTER_COLOR,
                                backgroundColor: EVALUATING_BUTTON_BACKGROUND_COLOR,
                                screenHeight: geometry.size.height,
                                onTap: {
                                    calculatorViewModel.evaluate()
                                }
                            ).frame(width: max(0, geometry.size.width / 4 - 14))
                        }.frame(height: max(0, (innerGeometry.size.height / 5) * 2 - (8 * 3)))
                    }
                    .padding()
                }
            }
            .background(APPLICATION_BACKGROUND_COLOR)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        themeViewModel.toggleMode()
                    }) {
                        Image(
                            systemName: themeViewModel.isDarkMode
                                ? LIGHT_MODE_ICON_NAME : DARK_MODE_ICON_NAME
                        )
                        .foregroundColor(CHANGE_THEME_MODE_ICON_COLOR)
                    }.accessibilityLabel(
                        INTERNATIONAL_TOOLBAR_TOGGLE_MODE_BUTTON_ACCESSIBILITY_LABEL
                    )
                    .accessibilityIdentifier(
                        TOOLBAR_TOGGLE_MODE_BUTTON_ACCESSIBILITY_IDENTIFIER)
                }
            }
        }
    }
}

struct CalculatorScreen_Previews: PreviewProvider {
    @StateObject static private var calculatorViewModel = CalculatorViewModelFactory.getInstance()
    @StateObject static private var themeViewModel = ThemeViewModelFactory.getInstance(
        deviceMode: UIScreen.main.traitCollection.userInterfaceStyle
    )

    static var previews: some View {
        CalculatorScreen()
            .environmentObject(calculatorViewModel)
            .environmentObject(themeViewModel)
    }
}
