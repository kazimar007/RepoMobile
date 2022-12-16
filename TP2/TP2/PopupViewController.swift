//
//  PopupViewController.swift
//  TP2
//
//  Created by user228865 on 12/15/22.
//

import UIKit
var names = [
    "asd", "asdas"]

class PopupViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func btnQuitterPressed(_ sender: Any) {
        dismiss(animated: true)
    }
}

extension PopupViewController: UITableViewDelegate{}

extension PopupViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = names[indexPath.row]
        
        return cell
    }
}
