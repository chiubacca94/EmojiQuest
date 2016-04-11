//
//  GameManager.swift
//  EmojiQuest
//
//  Created by Brittany Chiu on 4/11/16.
//  Copyright © 2016 IST446. All rights reserved.
//

import Foundation

class GameManager {
    static let sharedInstance = GameManager()
    
    let story = Story.sharedInstance
    let player = Player.sharedInstance
    
    var score = 0
    var previousGameExists = false
    
    func incrementScore(amount: Int) {
        score += amount
    }
    
    func getScore() -> Int {
        return score;
    }
    
    func newGame() {
        // TODO
    }
    
    func gameOver() {
        // TODO
    }
}