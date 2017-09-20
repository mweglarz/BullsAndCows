
import Foundation

enum AnswerState {
  case invalidInput
  case invalidLength
  case notLowercase
  case notIsogram
  case invalidGuess
  case correctGuess
}

func validateAnswer(userAnswer: String?, isogram: String) -> AnswerState {
  return userAnswer ?? "" == isogram ? .correctGuess : .invalidGuess
}

func printCorrectGuess() {
  print("Haslo poprawne!")
}

func printWrongGuess() {
  print("Sprobuj jeszcze raz!")
}

let isogram = "tesla"

mainLoop: while true {

  print("Zgadnij haslo")
  
  let userGuess = readLine() ?? ""
  print("haslo = \(isogram), twoj typ = \(userGuess)")

  let answerState = validateAnswer(userAnswer: userGuess, isogram: isogram)

  switch answerState {
    case .correctGuess:
      printCorrectGuess()
      break mainLoop
    default:
      printWrongGuess()
  }
}


