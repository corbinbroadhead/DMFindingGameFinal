//
//  StartViewController.swift
//  DMFindingGame
//
//  Created by David Ruvinskiy on 4/17/23.
//

import UIKit

/**
 1.1 Create the user interface. The app will have two screens: the start screen and the game screen. The start screen will be controlled by the `StartViewController`, and the game screens will be controlled by the `GameViewController`.  See the provided screenshots and video for how the UI should look. Feel free to customize the colors, font, etc.
 1.2 Create an IBOutlet for the high score label.
 */
class StartViewController: UIViewController {
    
    @IBOutlet weak var bestScoreLabel: UILabel!
    
    var bestScore = CoreDataManager.shared.calculateHighScore()
    let gameBrain = GameBrain.shared
    
    /**
     3.1 Update the `highScoreLabel`'s text to be the high score from the game brain.
     */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bestScore = CoreDataManager.shared.calculateHighScore()
        bestScoreLabel.text = "Best Score: \(bestScore)"
    }
    
    /**
     4.1 Transition the user to the `GameViewController` when the start button is tapped.
     */
    @IBAction func startPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let gameViewController = storyboard.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        navigationController?.pushViewController(gameViewController, animated: true)
    }
    
    @IBAction func viewAllPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let statsViewController = storyboard.instantiateViewController(withIdentifier: "StatsViewController") as! StatsViewController
        navigationController?.pushViewController(statsViewController, animated: true)
    }
}
