//
//  CardDetailViewController.swift
//  Quiz
//
//  Created by Nil Nguyen on 3/7/21.
//

import UIKit

class CardDetailViewController: UIViewController {
    var card : Flashcard! {
        didSet{
            navigationItem.title = card.keyword
        }
    }
    
    @IBOutlet var keywordLabel: UILabel!
    @IBOutlet var hintLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        keywordLabel.text = card.keyword
        hintLabel.text = card.hint
    }
}
