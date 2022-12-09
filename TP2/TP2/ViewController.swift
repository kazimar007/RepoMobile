//
//  ViewController.swift
//  TP2
//
//  Created by user228865 on 11/25/22.
//

import UIKit

// TODO: Faire un fichier pour le controller (View Model)
struct GameData {
    var manStage = 1
    var availableLetter = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    var mysteryWord = "Inconnue"
    var wordProgress = "________"
}

// TODO: Utiliser l'API pour obtenir un mot
var wordBank = ["Os", "Marteau", "Atelier", "Ceinture", "Incroyable"]

var theGame = GameData()

class ViewController: UIViewController {

    @IBOutlet weak var labWordToFind: UILabel!
    @IBOutlet weak var txfLetterEntry: UITextField!
    @IBOutlet weak var labAllLetter1: UILabel!
    @IBOutlet weak var labAllLetter2: UILabel!
    @IBOutlet weak var imgBody: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetGame()
        loadGameView()
    }
    
    @IBAction func txfLetterEntryEditingChanged(_ sender: Any) {
        let theLetter = String(txfLetterEntry.text!.prefix(1))
        txfLetterEntry.text = ""
        
        if isLetterAvailable(letter: theLetter.uppercased()) {
            txfLetterEntry.placeholder = "Entrez une lettre disponible"
            removeTheLetterInAvailable(letter: theLetter.uppercased())
            if isTheLetterInTheWord(letter: theLetter.uppercased()) {
                // TODO: Marche pas
                revealTheLetter(letter: theLetter.uppercased())
            } else {
                theGame.manStage += 1
                if theGame.manStage >= 7 {
                    // TODO: Confirmer s'il veut recommencer
                }
            }
            loadGameView()
        } else {
            txfLetterEntry.placeholder = "La lettre n'est pas disponible"
        }
    }
    
    func loadGameView() {
        // TODO: Verifier quand t'il n'y a pas de lettre dans theGame.availableLetter
        labAllLetter1.text = ""
        labAllLetter2.text = ""
        for letter in theGame.availableLetter {
            if labAllLetter1.text!.count < 26 {
                labAllLetter1.text? += String(letter) + " "
            } else {
                labAllLetter2.text? += String(letter) + " "
            }
        }
        imgBody.image = UIImage(named: "manStage" + String(theGame.manStage) + ".png")
        
        labWordToFind.text = ""
        for letter in theGame.wordProgress {
            labWordToFind.text? += String(letter) + " "
        }
    }
    
    func resetGame() {
        theGame.manStage = 1
        theGame.availableLetter = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        theGame.mysteryWord = wordBank.randomElement()!.uppercased()
        theGame.wordProgress = ""
        for _ in theGame.mysteryWord {
            theGame.wordProgress.append("_")
        }
    }
    
    func isLetterAvailable(letter: String) -> Bool {
        for availableLetters in theGame.availableLetter {
            if String(availableLetters) == letter {
                return true
            }
        }
        return false
    }
    
    func removeTheLetterInAvailable(letter: String) {
        var newString = ""
        for availableLetter in theGame.availableLetter {
            if String(availableLetter) != letter {
                newString += String(availableLetter)
            }
        }
        theGame.availableLetter = newString
    }
    
    func isTheLetterInTheWord(letter: String) -> Bool {
        for mysteryLetter in theGame.mysteryWord {
            if String(mysteryLetter) == letter {
               return true
            }
        }
        return false
    }
    
    func revealTheLetter(letter: String) {
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
            } else if index == indexToAdd[0] {
                newString += String(letterToAdd[nextIndex])
                nextIndex += 1
            } else {
                newString += "_"
            }
            index += 1
        }
    }
}

