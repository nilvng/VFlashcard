//
//  Flashcard.swift
//  Quiz
//
//  Created by Nil Nguyen on 3/6/21.
//

import Foundation
class Flashcard {
    var keyword: String
    var hint : String
    var moreDetail : String?
    var dateTested : Date
    var level : Level
    
    enum Level {
        case hard
        case medium
        case easy
    }
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
    
}