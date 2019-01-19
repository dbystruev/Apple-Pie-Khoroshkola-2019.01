//
//  ViewController.swift
//  Apple Pie
//
//  Created by Denis Bystruev on 19/01/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var listOfWords = ["Апельсин", "Банан", "Яблоко"]
    
    let incorrectMovesAllowed = 7
    
    var totalWins = 0
    var totalLosses = 0
    
    var currentGame: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    func newRound() {
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
        updateUI()
    }
    
    func updateUI() {
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
        scoreLabel.text = "Выигрыши: \(totalWins), проигрыши: \(totalLosses)"
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        sender.isEnabled = false
        
        let letterString = sender.title(for: .normal)!
        let letter = letterString.lowercased()
        currentGame.playerGuessed(letter: letter)
        updateUI()
    }
}

