//
//  ViewController.swift
//  ExamenFinale
//
//  Created by user228865 on 12/13/22.
//

import UIKit



class ViewController: UIViewController {
    
    public var listColor: [Int] = []
    public var pressedCount: Int = 0
    
    
    public var highScore: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnInitColor()
        enableBtn(setting: false)
        labMessage.text = "Press start"
    }
    @IBOutlet weak var btnStart: UIButton!
    @IBOutlet weak var labMessage: UILabel!
    
    @IBAction func btnStarting(_ sender: Any) {
        btnStart.isEnabled = false
        btnStart.isHidden = true
        addColor()
        showSequence()
    }
    
    @IBOutlet weak var labHighScore: UILabel!
    @IBOutlet weak var btnJ: UIButton!
    @IBOutlet weak var btnV: UIButton!
    @IBOutlet weak var btnR: UIButton!
    @IBOutlet weak var btB: UIButton!
    
    

    
    @IBAction func btnVert(_ sender: Any) {
        btnPressed(color: 1)
    }
    @IBAction func btnBleu(_ sender: Any) {
        btnPressed(color: 2)
    }
    @IBAction func btnRouge(_ sender: Any) {
        btnPressed(color: 3)
    }
    @IBAction func btnJaune(_ sender: Any) {
        btnPressed(color: 4)
    }
    
    func btnPressed(color: Int) {
        if (listColor[pressedCount] == color) {
            
            pressedCount += 1
            labMessage.text = "Good : " + String(pressedCount)
            if (pressedCount == listColor.count) {
                labMessage.text = "Sequence completed"
                pressedCount = 0
                addColor()
                showSequence()
            }
        } else {
            highScore.append("\(NSDate()) : \(pressedCount)")
            var affichage: String = ""
            for score in highScore {
                affichage.append("\(score)\n")
            }
            
            labHighScore.text = affichage
            
            resetGame()
            pressedCount = 0
        }
    }
    
    func addColor() {
        listColor.append(Int.random(in: 1..<5))
    }
    
    func showSequence() {
        labMessage.text = "Wait"
        enableBtn(setting: false)
        for color in listColor {
            showColor(color: color)
        }
        enableBtn(setting: true)
        translateSequeece()
    }
    
    func translateSequeece() {
        var sequence: String = ""
        for color in listColor {
            switch color {
            case 1:
                sequence.append("V")
            case 2:
                sequence.append("B")
            case 3:
                sequence.append("R")
            case 4:
                sequence.append("J")
            default:
                sequence.append("erreur")
            }
        }
        labMessage.text = sequence
    }
    
    func btnInitColor() {
        btnJ.backgroundColor = UIColor.yellow
        btnV.backgroundColor = UIColor.green
        btnR.backgroundColor = UIColor.red
        btB.backgroundColor = UIColor.blue
    }
    
    func showColor(color: Int) {
        // Marche pas :(
        switch color {
        case 1:
            
            let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { timer in
                self.btnV.backgroundColor = UIColor.white
            }
            self.btnV.backgroundColor = UIColor.white
            timer.fire()
            btnV.backgroundColor = UIColor.green
            break
        case 2:
            
            let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { timer in
                self.btB.backgroundColor = UIColor.white
            }
            self.btB.backgroundColor = UIColor.white
            timer.fire()
            btB.backgroundColor = UIColor.blue
            break
        case 3:
            
            let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { timer in
                self.btnR.backgroundColor = UIColor.white
            }
            self.btnR.backgroundColor = UIColor.white
            timer.fire()
            btnR.backgroundColor = UIColor.red
            break
        case 4:
            let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { timer in
                self.btnJ.backgroundColor = UIColor.white
            }
            self.btnJ.backgroundColor = UIColor.white
            timer.fire()
            btnJ.backgroundColor = UIColor.yellow
            break
        default:
            break
        }
    }
    
    @objc func fireTimer() {
        print("Timer fired!")
    }
    
    func resetGame() {
        listColor = []
        flash()
        addColor()
        showSequence()
    }
    
    func flash() {
        let timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { timer in
            self.btnJ.backgroundColor = UIColor.white
            self.btnJ.backgroundColor = UIColor.white
            self.btnJ.backgroundColor = UIColor.white
            self.btnJ.backgroundColor = UIColor.white
        }
    }
    
    func enableBtn(setting: Bool) {
        if (setting)
        {
            btnJ.isEnabled = true
            btnR.isEnabled = true
            btB.isEnabled = true
            btnV.isEnabled = true
        } else {
            btnJ.isEnabled = false
            btnR.isEnabled = false
            btB.isEnabled = false
            btnV.isEnabled = false
        }
    }
}
