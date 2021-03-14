//
//  CardDetailViewController.swift
//  Quiz
//
//  Created by Nil Nguyen on 3/7/21.
//

import UIKit

class CardDetailViewController: UIViewController {
    
    @IBOutlet var keywordLabel: UILabel!
    @IBOutlet var hintLabel: UILabel!
    
    
    var card : Flashcard! {
        didSet{
            navigationItem.title = card.keyword
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        keywordLabel.text = card.keyword
        hintLabel.text = card.hint
    }
}
