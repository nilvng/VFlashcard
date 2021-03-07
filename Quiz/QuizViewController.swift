//
//  ViewController.swift
//  Quiz
//
//  Created by Nil Nguyen on 2/10/21.
//

import UIKit

class QuizViewController: UIViewController {
    @IBOutlet var questionLabel : UILabel!
    @IBOutlet var answerLabel : UILabel!
    
    var flashcardStore : FlashcardStore!
    
    var currentQuesIndex = 0
    var currentCard = Flashcard()
    
    @IBAction func showNextQuestion(_ sender : UIButton) {
        currentQuesIndex += 1
        if (currentQuesIndex == flashcardStore.allFlashcards.count){
            currentQuesIndex = 0
        }
        self.currentCard = flashcardStore.allFlashcards[currentQuesIndex]
        questionLabel.text = currentCard.keyword
        answerLabel.text = "???"
    }
    
    @IBAction func showAnswer(_ sender : UIButton ){
        answerLabel.text = currentCard.hint
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        questionLabel.text = flashcardStore.allFlashcards[currentQuesIndex].keyword
    }
}

