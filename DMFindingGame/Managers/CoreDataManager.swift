//
//  CoreDataManager.swift
//  DMFindingGame
//
//  Created by David Ruvinskiy on 4/24/23.
//

import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Main")
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                fatalError("Fatal error loading store: \(error.localizedDescription)")
            }
        }
        return container
    }()
    
    /**
     Add the passed score to CoreData.
     */
    func addScore(score: Int) {
        let scoreObject = Score(context: persistentContainer.viewContext)
        scoreObject.score = Int16(score)
        do {
            try persistentContainer.viewContext.save()
        } catch {
            
        }
    }
    
    /**
     Retrieve all the scores from CoreData.
     */
    func fetchScores() -> [Score] {
        do {
            let request = NSFetchRequest<Score>(entityName: "Score")
            print(try persistentContainer.viewContext.fetch(request))
            return try persistentContainer.viewContext.fetch(request)
        } catch {
            return []
        }
    }

    /**
     Calculate the high score.
     */
    func calculateHighScore() -> Int {
        do {
            let request = NSFetchRequest<Score>(entityName: "Score")
            request.predicate = NSPredicate(value: true)
            
            let sortDescriptor = NSSortDescriptor(key: "score", ascending: false)
            request.sortDescriptors = [sortDescriptor]
            
            let scores = try persistentContainer.viewContext.fetch(request)
            return Int(scores.first?.score ?? 0)
        } catch {
            return 0
        }
    }
}








