//
//  Question.swift
//  Quizzler
//
//  Created by Dhanushikka Ravichandiran on 5/25/18.
//  
//

import Foundation

class Question{
    
    let questionText : String
    let answer : Bool
    
    init(text : String, correctAnswer : Bool){
        questionText = text
        answer = correctAnswer
    }
    
}
