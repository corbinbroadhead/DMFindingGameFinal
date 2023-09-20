//
//  StatsViewController.swift
//  DMFindingGame
//
//  Created by Corbin Broadhead on 9/14/23.
//

import UIKit
import CoreData

class StatsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var scores = CoreDataManager.shared.fetchScores()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        print(scores)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScoreCell", for: indexPath)
        let score = scores[indexPath.row].score
        cell.textLabel?.text = "\(score)"
        
        return cell
    }
}
