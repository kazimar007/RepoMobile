//
//  PopupViewController.swift
//  TP2
//
//  Created by user228865 on 12/15/22.
//

import UIKit

class PopupViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txfSearch: UITextField!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        self.txfSearch.delegate = self
        
        var isCompleted = true
        for letter in theGame.wordProgress {
            if letter == "_" {
                isCompleted = false
            }
        }
        if isCompleted {
            txfSearch.text = theGame.mysteryWord
            APIController.setHighScoreArray(word: txfSearch.text!)
        }
    }
    
    @IBAction func txfSearchEditingChanged(_ sender: Any) {
        if !txfSearch.text!.trimmingCharacters(in: .whitespaces).isEmpty {
            APIController.setHighScoreArray(word: txfSearch.text!)
        }
    }
    
    @IBAction func btnSearchPressed(_ sender: Any) {
        tableView.reloadData()
    }
    
    @IBAction func btnQuitterPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        tableView.reloadData()
        return true
    }
}


extension PopupViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return theGame.highScore.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = theGame.highScore[indexPath.row]
        
        return cell
    }
}
