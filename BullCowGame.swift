
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
    var canTryAgain: Bool { return self.currentTry < self.maxTries }

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
        
        let stats = BullCowGame.getStats(guess: guess, word: self.word)

        return (success: success, stats: stats)
    }

    private func printIntro() {
        print("Zgadnij wyraz na \(self.wordLength) liter (\(self.word))")
    }

    private func printCorrectGuess() {
        print("Haslo poprawne!")
    }

    private func printWrongGuess() {
        print("Sprobuj jeszcze raz!")
    }
}

extension BullCowGame {
    
    static func getStats(guess: String, word: String) -> GuessStats {
        guard guess.characters.count == word.characters.count
            else { return GuessStats(bulls: 0, cows: 0) }

        var bulls = 0
        var cows = 0

        for i in 0..<guess.characters.count {
            let gIndex = guess.index(guess.startIndex, offsetBy: i)
            let wIndex = word.index(word.startIndex, offsetBy: i)
            let gChar = guess.characters[gIndex]
            let wChar = word.characters[wIndex]

            if gChar == wChar {
                bulls += 1
            } else if word.characters.contains(gChar) {
                cows += 1
            }
        }

        return GuessStats(bulls: bulls, cows: cows)
    }
}


