//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Nicholas Ong on 10/12/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question{
    let questionTitle: String
    let answer:[String]
    let correctAnswer:String
    init(q:String, a:[String],correctAnswer:String){
        questionTitle = q
        answer = a
        self.correctAnswer = correctAnswer
    }
}
