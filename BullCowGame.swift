
import Foundation

enum InputState {
    case invalidInput
    case invalidLength
    case notLowercase
    case notIsogram
    case correct(word: String)

    var isCorrect: Bool {
        switch self {
        case .correct(_): return true
        default: return false
        }
    }
}

struct GuessStats {
    var bulls: Int
    var cows: Int
}

class BullCowGame {

    typealias GameResult = (success: Bool, stats: GuessStats)

    var wordLength: Int { return self.word.characters.count }
    var maxTries: Int
    var isGameWon: Bool = false
    var canTryAgain: Bool { return self.currentTry <= self.maxTries }

    private var word: String
    private var currentTry = 0

    init(word: String, maxTries: Int) {
        self.word = word
        self.maxTries = maxTries
    }

    func getAndValidateUserInput() -> InputState {
        self.printIntro()
        let answer = readLine()
        let state = BullCowInputValidator.validateAnswer(userAnswer: answer,
                                                         wordLength: wordLength)
        if !state.isCorrect { BullCowInputValidator.printInvalidInputMessage(state: state) }

        return state
    }

    func submitUserGuess(guess: String) -> GameResult {
        self.currentTry += 1

        let success = guess == self.word
        self.isGameWon = success
        
        let stats = GuessStats(bulls: 0, cows: 0)

        return (success: success, stats: stats)
    }

    private func printIntro() {
        print("Zgadnij wyraz na \(self.wordLength) liter")
    }

    private func printCorrectGuess() {
        print("Haslo poprawne!")
    }

    private func printWrongGuess() {
        print("Sprobuj jeszcze raz!")
    }
}


