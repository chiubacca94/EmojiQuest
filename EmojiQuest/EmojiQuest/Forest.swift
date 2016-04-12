//
//  Forest.swift
//  EmojiQuest
//
//  Created by Emma Roudabush on 4/11/16.
//  Copyright © 2016 IST446. All rights reserved.
//

import Foundation

class Forest {
    static let sharedInstance = Forest()
    
    let story = Story.sharedInstance
    let woodsman = Woodsman.sharedInstance
    var currentNPC : NPC?
    
    init() {
        currentNPC = woodsman
    }
    
    func introductoryText() -> String {
        return "You wake up in the middle of the woods. Your head hurts and your throat is sore. In front of you is a giant beast of a man, eating lunch. There are trees in every direction."
    }
    
    func parseEmoji(playerResponse: String) -> String {
        return woodsman.respondTo(playerResponse)
    }
}