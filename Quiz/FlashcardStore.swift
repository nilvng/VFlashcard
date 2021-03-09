//
//  FlashcardStore.swift
//  Quiz
//
//  Created by Nil Nguyen on 3/6/21.
//

import UIKit

class FlashcardStore {
    
    var allFlashcards = [Flashcard]()
    
    @discardableResult func createFlashcard() -> Flashcard {
        let flashcard = Flashcard(random: true)
        allFlashcards.append(flashcard)
        return flashcard
    }
    
    func moveCard (fromRow : Int, toRow : Int){
        if fromRow == toRow {
            return
        }
        let movedCard = allFlashcards[fromRow]
        allFlashcards.remove(at: fromRow)
        allFlashcards.insert(movedCard, at: toRow)
    }
}
