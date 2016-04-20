//
//  Stewart.swift
//  EmojiQuest
//
//  Created by Emma Roudabush on 4/11/16.
//  Copyright © 2016 IST446. All rights reserved.
//

import Foundation

// make a library for speech

enum StewartState : String {
    case FoundPlayer = "foundPlayer"
    case Confused = "confused"
    case Willing = "willing"
}

class Stewart: NPC {
 
    static let sharedInstance = Stewart()
    
    var currentState : StewartState = StewartState.FoundPlayer
    
    override init() {
        super.init()
    }
    
    func respondTo(playerResponse: String) -> String {
        switch (currentState) {
        case .FoundPlayer:
            return parseResponseIfFound(playerResponse)
        case .Confused:
            return parseResponseIfConfused(playerResponse)
        case .Willing:
            return parseResponseIfWilling(playerResponse)
        }
    }
    
    func parseResponseIfFound(playerResponse: String) -> String {
        
        let response = playerResponse.lowercaseString
        
        switch(response){
            
        case "kingdom":
            currentState = .FoundPlayer
            return "The Kingdom is flourishing under the reign of our benevolent King and Queen. Truth be told though, neither of them really do much governing. It’s largely due to the efforts of the court Wizard that the economy has made such a turn around"
        case "king":
            return "The King is an excellent man, and has seen our Kingdom through many tough years. He rarely bothers much with state policy, preferring to feast and drink and be merry. He leaves the Wizard in charge of decision making most of the time. When he does bother with it though, he tries to make up for lost time by passing a bunch of laws immediately, without consulting the Wizard."
        case "queen":
            return "The Queen is a truly magnanimous lady and wife to the King. The sweetest person in the entire Kingdom, even if she isn’t sharpest edge in the armory. I’d hate to give her any unpleasant news. Good thing nothing bad ever happens in the castle."
        case "wizard":
            return "The Wizard is a really nice guy. He’s always looking out for the King, skulking in dark corners and listening through key holes. He’s really got his back. They occasionally disagree about matters of state, but really, they’re the best of friends."
        case "king’s suite":
            return "The King’s Suite? You don’t know where it is? Oh of course you don’t, you’re always scrubbing away in the feast hall. Hehe. Well, you’ll figure it out. Bye now!"
        case "quest":
            return "Oh yes. Your quest, O mighty hero, is to… clean the King’s Suite because the usual guy, er, brave knight, has fallen ill-- er, been injured in the line of duty. Dear Lord, talking like this is tiring. How do you manage to keep this up? I’m bored now. Please leave."
        default:
            return "You just wasted my time, didn't I give you a QUEST?"
        }

    }
    
    func parseResponseIfConfused(playerResponse: String) -> String {
        if playerResponse.containsString("🌲") {
            currentState = .Willing
            return "Hurumph (He seems to like what you are doing)"
        } else {
            return "The Woodsman is staring at you"
        }
    }
    
    func parseResponseIfWilling(playerResponse: String) -> String {
        if playerResponse.containsString("🌲") {
            //          story.transitionSceneTo(StoryScene.Village)
            return "The Woodsman grabs your hand and starts leading you away."
        } else {
            return "The Woodsman is staring at you"
        }
    }
    
    func doTransition(){
        StoryScene.VillageOutsideCastle;
        
        // true when change and change to
    }
    
}