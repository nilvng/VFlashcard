//
//  CardsViewController.swift
//  Quiz
//
//  Created by Nil Nguyen on 3/7/21.
//

import UIKit

class CardsViewController : UITableViewController {
    var flashcardStore : FlashcardStore!
    
    @IBAction func addNewCard (_ button : UIBarItem) {
        print("added card!")
        let newCard = flashcardStore.createFlashcard()
        if let row = flashcardStore.allFlashcards.firstIndex(of: newCard){
            let indexPath = IndexPath(row: row, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "takeQuiz":
            let quizVC = segue.destination as! QuizViewController
            quizVC.flashcardStore = flashcardStore
        case "showCard":
            if let selectedIndex = tableView.indexPathForSelectedRow {
                let detailVC = segue.destination as! CardDetailViewController
                detailVC.card = flashcardStore.allFlashcards[selectedIndex.row]
            }
        default:
            preconditionFailure("Unexpected segue identifier")

        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flashcardStore.allFlashcards.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableCell", for: indexPath)
        let card = flashcardStore.allFlashcards[indexPath.row]
        
        cell.textLabel?.text = card.keyword
        cell.detailTextLabel?.text = "\(card.level)"
        
        return cell
    }
}
