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
    
    let player = Player.sharedInstance
    
    var score = 0
    var previousGameExists = false
    var gameLost = false
    var gameOverReason : String?
    
    func incrementScore(amount: Int) {
        score += amount
        NSNotificationCenter.defaultCenter().postNotificationName(ScoreUpdateNotificationKey, object: self)
    }
    
    func getScore() -> Int {
        return score;
    }
    
    func newGame() {
        score = 0
        player.newPlayer()
    }
    
    func newGameText() -> String {
        return "\nYou were born into greatness. You are the latest in a long line of heroes who have saved the realm since time immemorial . Their legends are proclaimed in great halls and spoken of in hushed whispers alike. You ponder your great legacy as you continue to clean the feast hall."
    }
    
    func gameOver(gameOverText: String) {
        gameLost = true
        gameOverReason = gameOverText
    }
}