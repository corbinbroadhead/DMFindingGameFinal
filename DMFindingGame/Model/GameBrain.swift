//
//  GameBrain.swift
//  DMFindingGame
//
//  Created by David Ruvinskiy on 4/17/23.
//

import Foundation

/**
 2.1 Create a class called `GameBrain`. `GameBrain` will be a singleton that can be accessed in `StartViewController` and `GameViewController`. The code that makes this class a singleton is provided.
 
 A `GameBrain` should have the following properties:
 
    - A String `targetLetter` initially set to an empty String
    - A [String] `randomLetters` initially set to an empty array
    - An Int `score` initially set to 0
    - An Int `highScore` initially set to 0
    - An Int `numLetters` initially set to 0
    - An Int `secondsRemaining` set to 30
    - An Int `letters` set to 30
    - A [String] `letters` set to the letters of the alphabet.
 
 A `GameBrain` should also have the following methods:
 
    - `generateRandomLetters`:  Returns an array of letters. There should be as many letters as `numLetters`. The array should include the target letter. The rest of the letters should be random. A letter should show up in the array only once. The order of the letters should be random.
 
    - `newRound`: Sets the `targetLetter` to a random letter from the `letters` array and sets `randomLetters` to the result of calling `generateRandomLetters`.
 
    - `newGame`:  Accepts the number of letters for the game and assigns `numLetters` accordingly. Also sets the `score` to 0, sets the `secondsRemaining` to 30, and calls `newRound`.
 
    - `letterSelected`: Accepts the letter the user selected and updates the `score` and `highScore` accordingly. Also, calls `newRound`.
 
 Run the tests in `DMFindingGameTests` to make sure your code is correct.
 */
class GameBrain {
    
    var targetLetter: String = ""
    var randomLetters: [String] = []
    var score: Int = 0
    var highScore: Int = 0
    var numLetters: Int = 0
    var secondsRemaining: Int = 30
    var letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    func generateRandomLetters() -> [String]{
        var randomArray = letters.shuffled() // creates a shuffled copy of the letters array
        
        let numToRemove = letters.count - numLetters // removes the necessary number of letters
        
        randomArray.removeLast(numToRemove) //
        
        let target = targetLetter
        
        if randomArray.contains(target) == false {
            randomArray.removeLast()
            randomArray.append(target)
            randomArray.shuffle()
        }
        return randomArray
    }
    
    func newRound() {
        targetLetter = letters.randomElement() ?? "D"
        randomLetters = generateRandomLetters()
    }
    
    func newGame(numLetters num: Int) {
        numLetters = num
        score = 0
        secondsRemaining = 30
        newRound()
    }
    
    func letterSelected(letter selection: String) {
        if selection == targetLetter {
            score += 1
            if score > highScore {
                highScore = score
            }
        }
        newRound()
    }
    
    /**
     This code makes `GameBrain` a singleton. You do not need to modify this code.
     */
    static let shared = GameBrain()
    private init() {}
}
