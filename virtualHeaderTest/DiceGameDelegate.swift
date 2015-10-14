//
//  DiceGameDelegate.swift
//  virtualHeaderTest
//
//  Created by Dustin Stevens on 10/10/15.
//  Copyright © 2015 self. All rights reserved.
//

import Foundation

class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    
    func gameDidStart(game: DiceGame) {
        numberOfTurns = 0
        
        if game is SnakesAndLadders {
            print("Started a new game of Snakes and Ladders")
        }
        
        print("The game is using a \(game.dice.sides)-sided dice")
    }
    
    func game(game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        ++numberOfTurns
        print("Rolled a \(diceRoll)")
    }
    
    func gameDidEnd(game: DiceGame) {
        print("The game lasted for \(numberOfTurns)")
    }
}