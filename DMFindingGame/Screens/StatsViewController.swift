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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CoreDataManager.shared.fetchScores().count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScoreCell", for: indexPath)
        
        let request = NSFetchRequest<Score>(entityName: "Score")
        do {
            let scores = try CoreDataManager.shared.persistentContainer.viewContext.fetch(request)
            cell.textLabel?.text = "\(scores[indexPath.row].value(forKey: "Score"))"
        } catch {
            print("error occured loading table view")
        }
        
        return cell
    }
}
