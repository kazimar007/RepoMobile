//
//  ViewController.swift
//  TP2
//
//  Created by user228865 on 11/25/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labWordToFind: UILabel!
    @IBOutlet weak var txfLetterEntry: UITextField!
    @IBOutlet weak var labAllLetter1: UILabel!
    @IBOutlet weak var labAllLetter2: UILabel!
    @IBOutlet weak var imgBody: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadGame()
    }
    
    func loadGame() {
        labAllLetter1.text = "A B C D E F G H I J K L M"
        labAllLetter2.text = "N O P Q R S T U V W X Y Z"
        imgBody.image = UIImage(named: "manStage1.png")
    }


}

