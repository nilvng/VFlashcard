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
    
    @IBAction func showNextQuestion(_ sender : UIButton) {
        currentQuesIndex += 1
        if (currentQuesIndex == flashcardStore.allFlashcards.count){
            currentQuesIndex = 0
        }
        let currentCard = flashcardStore.allFlashcards[currentQuesIndex]
        questionLabel.text = currentCard.keyword
        answerLabel.text = "???"
    }
    
    @IBAction func showAnswer(_ sender : UIButton ){
        let currentCard = flashcardStore.allFlashcards[currentQuesIndex]
        answerLabel.text = currentCard.hint
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentCard = flashcardStore.allFlashcards[currentQuesIndex]
        questionLabel.text = currentCard.keyword
    }
}

