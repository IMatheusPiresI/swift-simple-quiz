//
//  Question.swift
//  MVC-Quiz
//
//  Created by Matheus Sousa on 06/07/23.
//

import Foundation

struct Question {
    let text: String
    let awnser: String
    
    init(q: String, a: String) {
        self.text = q
        self.awnser = a
    }
}
