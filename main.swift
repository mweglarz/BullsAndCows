
import Foundation


func askToPlayAgain() -> Bool {
    print("Play again? y/n")
    guard let answer = readLine() else { return false }
    return answer == "y" || answer == "Y"
}

func printResult(result: BullCowGame.GameResult) {
    if result.success {
        print("Brawo! Zgadles!")
    } else {
        print("Sprobuj jeszcze raz, bulls: \(result.stats.bulls), cows: \(result.stats.cows)")
    }
}

func playGame() {
    let bullCowGame = BullCowGame(word: "tesla", maxTries: 2)
    
    while !bullCowGame.isGameWon && bullCowGame.canTryAgain {
        let state = bullCowGame.getAndValidateUserInput()
        guard case let InputState.correct(guess) = state else { continue }
        let result = bullCowGame.submitUserGuess(guess: guess)
        printResult(result: result)
    }
}

func main() {

    while true {
        playGame()
        if !askToPlayAgain() { break }
    }
}  

main()




