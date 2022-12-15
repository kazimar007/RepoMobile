//
//  ViewController.swift
//  TP2
//
//  Created by user228865 on 11/25/22.
//

import UIKit

var gameController = GameController()

class ViewController: UIViewController {

    @IBOutlet weak var labWordToFind: UILabel!
    @IBOutlet weak var txfLetterEntry: UITextField!
    @IBOutlet weak var labAllLetter1: UILabel!
    @IBOutlet weak var labAllLetter2: UILabel!
    @IBOutlet weak var imgBody: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameController.resetGame()
        loadGameView()
    }
    
    @IBAction func txfLetterEntryEditingChanged(_ sender: Any) {
        let status = gameController.letterEntry(entry: txfLetterEntry.text!)
        txfLetterEntry.text = ""
        
        switch status {
        case WRONG_LETTER:
            loadGameView()
            txfLetterEntry.placeholder = "Mauvaise lettre"
            break
        case GOOD_LETTER:
            loadGameView()
            txfLetterEntry.placeholder = "Bonne lettre"
            break
        case LOSE:
            loadGameView()
            txfLetterEntry.placeholder = "Vous avez perdu"
            break
        case WIN:
            loadGameView()
            txfLetterEntry.placeholder = "Vous avez gagne"
            break
        case UNAVAILABLE_LETTER:
            txfLetterEntry.placeholder = "La lettre n'est pas disponible"
            break
        default:
            txfLetterEntry.placeholder = "ERREUR 404 :("
            break
        }
    }
    
    func loadGameView() {
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
}
