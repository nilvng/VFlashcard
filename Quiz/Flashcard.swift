//
//  Flashcard.swift
//  Quiz
//
//  Created by Nil Nguyen on 3/6/21.
//

import Foundation
class Flashcard: Equatable {
    var keyword: String
    var hint : String
    var moreDetail : String?
    var dateTested : Date
    var level : Level

    init(keyword : String, hint : String, moreDetail : String?, level: Level = Level.hard) {
        self.keyword = keyword
        self.hint = hint
        self.moreDetail = moreDetail
        self.level = level
        self.dateTested = Date()
    }
    
    convenience init(random : Bool = false) {
        if random {
            
            let questions : [String] = [
                "PWA",
            "viewDidLoad()",
            "run simulator?"]
            
            let answers : [String] = [
            "have a native-app feeling, it can be used offline, and sync data later",
                "after the app launched, it will show the landing state of the app",
                "cmd + R"
            ]
            
            let keyword = questions.randomElement()!
            let answer = answers.randomElement()!
            
            self.init(keyword: keyword, hint: answer, moreDetail: nil)
            
        } else {
            self.init(keyword: "", hint: "", moreDetail: nil)
        }
    }
    
    static func == (lhs: Flashcard, rhs: Flashcard) -> Bool {
        return lhs.keyword == rhs.keyword &&
            lhs.dateTested == rhs.dateTested &&
            lhs.hint == rhs.hint &&
            lhs.level == rhs.level
    }

    
}


enum Level : String {
    case hard = "Hard (<30%)"
    case medium = "Medium (50%)"
    case easy = "Easy (>80%)"
}
