
import Foundation

class BullCowInputValidator {

    static func validateAnswer(userAnswer: String?, wordLength: Int) -> InputState {
        if userAnswer == nil {
            return .invalidInput

        } else if userAnswer!.characters.count != wordLength {
            return .invalidLength

        } else if userAnswer!.lowercased() != userAnswer! {
            return .notLowercase

        } else if !BullCowInputValidator.isIsogram(word: userAnswer!) {
            return .notIsogram

        } else {
            return .correct(word: userAnswer!)
        }
    }

    static func printInvalidInputMessage(state: InputState) {
        // TODO: print message depending on InputState
        var msg = ""
        switch state {
        case .invalidInput: msg = "Niepoprawne dane"
        case .invalidLength: msg = "Nieodpowiednia dlugosc"
        case .notLowercase: msg = "Uzywaj tylko malych liter"
        case .notIsogram: msg = "Litery nie moga sie powtarzac"
        default: break
        }

        print(msg)
    }

    static func isIsogram(word: String) -> Bool {
        var seenLetters: [Character: Bool] = [:]

        for letter in word.characters {
            if seenLetters[letter] == true {
                return false
            } else {
                seenLetters[letter] = true
            }
        }

        return true
    }
}



