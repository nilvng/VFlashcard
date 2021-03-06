//
//  FlashcardStore.swift
//  Quiz
//
//  Created by Nil Nguyen on 3/6/21.
//

import UIKit

class FlashcardStore {
    
    var allFlashcards = [Flashcard]()
    
    init(no : Int) {
        for _ in 0..<no {
            createFlashcard()
        }
        print(allFlashcards)
    }
    
    @discardableResult func createFlashcard() -> Flashcard {
        let flashcard = Flashcard(random: true)
        allFlashcards.append(flashcard)
        return flashcard
    }
    
}
