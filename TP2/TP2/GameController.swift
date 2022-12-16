//
//  GameController.swift
//  TP2
//
//  Created by user228865 on 12/14/22.
//

import Foundation

var wordBank = ["Os", "Marteau", "Atelier", "Ceinture", "Incroyable"]

var theGame = GameData()

class GameController {
    func letterEntry(entry: String) -> Int{
        let theLetter = String(entry.prefix(1))
        
        if isLetterAvailable(letter: theLetter.uppercased()) {
            removeTheLetterInAvailable(letter: theLetter.uppercased())
            if isTheLetterInTheWord(letter: theLetter.uppercased()) {
                // Lettre trouver
                updateProgress(letter: theLetter.uppercased())
                var isCompleted = true
                for letter in theGame.wordProgress {
                    if letter == "_" {
                        isCompleted = false
                    }
                }
                if isCompleted {
                    // Mot complete
                    resetGame()
                    return WIN
                }
                return GOOD_LETTER
            } else {
                // Mauvaise lettre
                theGame.manStage += 1
                if theGame.manStage >= 7 {
                    return LOSE
                }
                return WRONG_LETTER
            }
        } else {
            return UNAVAILABLE_LETTER
        }
    }
    
    private func isLetterAvailable(letter: String) -> Bool {
        for availableLetters in theGame.availableLetter {
            if String(availableLetters) == letter {
                return true
            }
        }
        return false
    }
    
    private func removeTheLetterInAvailable(letter: String) {
        var newString = ""
        for availableLetter in theGame.availableLetter {
            if String(availableLetter) != letter {
                newString += String(availableLetter)
            }
        }
        theGame.availableLetter = newString
    }
    
    private func isTheLetterInTheWord(letter: String) -> Bool {
        for mysteryLetter in theGame.mysteryWord {
            if String(mysteryLetter) == letter {
               return true
            }
        }
        return false
    }
    
    private func updateProgress(letter: String) {
        var letterToAdd = [Character]()
        var indexToAdd = [Int]()
        var index = 0
        for mysteryLetter in theGame.mysteryWord {
            if String(mysteryLetter) == letter {
                letterToAdd += letter
                indexToAdd.append(index)
            }
            index += 1
        }
        var newString = ""
        index = 0
        var nextIndex = 0
        for progressLetter in theGame.wordProgress {
            if progressLetter != "_" {
                newString += String(progressLetter)
            } else if nextIndex < indexToAdd.count {
                if index == indexToAdd[nextIndex] {
                    newString += String(letterToAdd[nextIndex])
                    nextIndex += 1
                } else {
                    newString += "_"
                }
            } else {
                newString += "_"
            }
            index += 1
        }
        theGame.wordProgress = newString
    }
    
    func resetGame() {
        theGame.manStage = 1
        theGame.availableLetter = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        //theGame.mysteryWord = wordBank.randomElement()!.uppercased()
        //APIController.getWord()
        theGame.mysteryWord = theGame.nextWord
        setWord()
        
        theGame.wordProgress = ""
        for _ in theGame.mysteryWord {
            theGame.wordProgress.append("_")
        }
    }
    
    func setWord() {
        APIController.setWord()
    }
}
