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
    
    let questions : [String] = [
        "PWA",
    "viewDidLoad()",
    "run simulator?"]
    
    let answers : [String] = [
    "have a native-app feeling, it can be used offline, and sync data later",
        "after the app launched, it will show the landing state of the app",
        "cmd + R"
    ]
    
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

