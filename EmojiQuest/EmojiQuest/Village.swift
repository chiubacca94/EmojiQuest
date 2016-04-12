//
//  Village.swift
//  EmojiQuest
//
//  Created by Emma Roudabush on 4/11/16.
//  Copyright © 2016 IST446. All rights reserved.
//

import Foundation

class Village {
    static let sharedInstance = Village()
    
    let story = Story.sharedInstance
    let merchant = Merchant.sharedInstance
    
    var currentNPC : NPC?
    
    init() {
        
    }
    
    func introductoryText() -> String {
        return "You end up in a village. Life! You turn to thank the woodsman only to find him..gone! *gasp* Oh wait, he just headed into the bar."
    }
    
    func parseEmoji(playerResponse: String) -> String {
        return ""
    }
}