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
    @IBOutlet var buttonsStackView: UIStackView!
    
    var flashcardStore : FlashcardStore!
    
    var currentQuesIndex = 0
    var currentCard = Flashcard()
    
    var rateLevelButtons : [UIButton] = [] {
        didSet{
            oldValue.forEach { $0.removeFromSuperview()}
            rateLevelButtons.forEach { buttonsStackView.addArrangedSubview($0)}
        }
    }
    var levels : [Level] = [] {
        didSet{
            rateLevelButtons = levels.map { level in
                let button = UIButton()
                button.setTitle(level.rawValue, for: .normal)
                button.backgroundColor = .blue
                button.addTarget(self, action: #selector(rateButtonPressed(_:)), for: .touchUpInside)
                return button
            }
        }
    }

    @objc func rateButtonPressed (_ sender: UIButton){
        guard rateLevelButtons.firstIndex(of: sender) != nil else {
            preconditionFailure("unidentified button pressed")
        }
        switch sender.titleLabel?.text {
        case Level.hard.rawValue:
            flashcardStore.allFlashcards[currentQuesIndex].level = .hard
        case Level.medium.rawValue:
            flashcardStore.allFlashcards[currentQuesIndex].level = .medium
        case Level.easy.rawValue:
            flashcardStore.allFlashcards[currentQuesIndex].level = .easy
        default:
            preconditionFailure("unidentified button pressed")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        levels = [.hard, .medium, .easy]
    }

    
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
        dump(currentCard)
    }
}

