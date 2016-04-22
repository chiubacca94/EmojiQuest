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
    
    let woodsman = Woodsman.sharedInstance
    var currentNPC : NPC?
    
    init() {
        currentNPC = woodsman
    }
    
    func introductoryText() -> String {
        return "You awake to a rough hand shaking you. What? Where are you? Oh god, you could have been unconscious for days, maybe weeks, while that wizardly villain parades around in the skin of your King! \n\n But who is this ruffian, who shakes you out of your stupor? An ally, or perhaps an agent of the Wizard? You open your mouth to demand answers and… \n\n “....⁉️” Nothing comes out 😲 ‼️ Drat, that villain has stolen your voice, such that you may never expose his foul secret! \n\n The man who woke you, clearly a woodsman by dress, says “....are you alright ❔"
    }
    
    func parseEmoji(playerResponse: String) -> String {
        // Check if text
        return woodsman.respondTo(playerResponse)
    }
}