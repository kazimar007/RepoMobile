//
//  TableViewControler.swift
//  ExamenFinale
//
//  Created by user228865 on 12/13/22.
//

import UIKit

class TableViewControler: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        var score: [String] = ["Today : 3"]
        insertRow(score: score)
    }
    @IBOutlet weak var cell: UITableView!
    @IBOutlet weak var laTableView: UITableView!
    
    func insertRow(score: [String]) {
        var indexPath = IndexPath(row: score.count, section: 0)
        laTableView.insertRows(at: [indexPath], with: .fade)
    }
    
}
