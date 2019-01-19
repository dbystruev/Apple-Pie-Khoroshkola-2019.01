//
//  Game.swift
//  Apple Pie
//
//  Created by Denis Bystruev on 19/01/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [String]
    
    mutating func playerGuessed(letter: String) {
        guessedLetters.append(letter)
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1
        }
    }
}
