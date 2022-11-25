//
//  ViewController.swift
//  Atelier 1 IOS
//
//  Created by user228865 on 11/10/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtPrixBrut: UITextField!
    @IBOutlet weak var switchTaxe: UISwitch!
    @IBOutlet weak var labMessage: UILabel!
    
    @IBOutlet weak var txtNbPerso: UITextField!
    @IBOutlet weak var txtPourcentage: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnCalculer(_ sender: Any) {
        if (txtPourcentage.text == "" || txtPrixBrut.text == "" || txtNbPerso.text == "") {
            labMessage.text = "Les champs ne doivent pas etre vident"
        }
        else if (!txtPrixBrut.text!.isNumber || !txtPourcentage.text!.isNumber || !txtNbPerso.text!.isNumber) {
            labMessage.text = "Le prix, le nombre de personne et le pourcentage doit etre des nombres"
        } else if (Double(txtPourcentage.text!)! > 30 || Double(txtPourcentage.text!)! < 0) {
            labMessage.text = "Le pourcentage doit etre entre 0 et 30"
        } else if ((Double(txtNbPerso.text!)! > 8) || (Double(txtNbPerso.text!)! < 0)) {
            labMessage.text = "Le nombre de personne doit etre entre 1 et 8"
        } else {
            labMessage.text = "Calcule en cours..."
            
            var prixbrut = Double(txtPrixBrut.text!)!
            if (switchTaxe.isOn) {
                prixbrut = prixbrut * 1.14975
            }
            prixbrut = prixbrut + ((prixbrut / 100) * Double(txtPourcentage.text!)!)
            prixbrut = prixbrut / Double(txtNbPerso.text!)!
            
            labMessage.text = String(prixbrut) + " $ par personne!"
            
        }
    }
    
}

extension String {
    var isNumber: Bool {
        let characters = CharacterSet.decimalDigits

        return CharacterSet(charactersIn: self).isSubset(of: characters)
    }
}
