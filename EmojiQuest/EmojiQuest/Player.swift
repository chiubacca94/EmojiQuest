//
//  Player.swift
//  EmojiQuest
//
//  Created by Emma Roudabush on 3/7/16.
//  Copyright © 2016 IST446. All rights reserved.
//

import Foundation

class Player {
    static let sharedInstance = Player()
    
    var inventory: [Item]
    
    init() {
        inventory = [Item]()
    }
    
    func printOutInventory() -> String {
        // TODO
        return ""
    }
    
    func newPlayer() {
        inventory = [Item]()
    }
}