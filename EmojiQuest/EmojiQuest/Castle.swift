//
//  Castle.swift
//  EmojiQuest
//
//  Created by Emma Roudabush on 4/11/16.
//  Copyright © 2016 IST446. All rights reserved.
//

import Foundation

class Castle {
    static let sharedInstance = Castle()
    
    let story = Story.sharedInstance
    let stewart = Stewart.sharedInstance
    let king = King.sharedInstance
    let queen = Queen.sharedInstance
    let knight = Knight.sharedInstance
    let wizard = Wizard.sharedInstance
    
    init() {
        
    }
    
    func parseText(playerResponse: String, scene: Int) -> String {
        return ""
    }
    
    func parseEmoji(playerResponse: String) -> String {
        return ""
    }
}