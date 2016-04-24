//
//  Stewart.swift
//  EmojiQuest
//
//  Created by Emma Roudabush on 4/11/16.
//  Copyright © 2016 IST446. All rights reserved.
//

import Foundation

enum StewardState : String {
    case GivingIntroInfo = "introInfo"
}

class Steward: NPC {
 
    static let sharedInstance = Steward()
    let gameManager = GameManager.sharedInstance
    
    var currentState : StewardState = StewardState.GivingIntroInfo
    var givenQuest = false
    
    override init() {
        super.init()
    }
    
    override func newGame() {
        givenQuest = false
        currentState = .GivingIntroInfo
    }
    
    func respondTo(playerResponse: String) -> String {
       return parseResponseInfo(playerResponse)
    }
    
    func parseResponseInfo(playerResponse: String) -> String {
        let response = playerResponse.lowercaseString.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet()
        )
        
        switch(response){
        case "kingdom":
            return "\nThe Kingdom is flourishing under the reign of our benevolent KING and QUEEN. Truth be told though, neither of them really do much governing. It’s largely due to the efforts of the court WIZARD that the economy has made such a turn around.\n"
        case "king":
            return "\nThe King is an excellent man, and has seen our Kingdom through many tough years. He rarely bothers much with state policy, preferring to feast and drink and be merry. He leaves the Wizard in charge of decision making most of the time. When he does bother with it though, he tries to make up for lost time by passing a bunch of laws immediately, without consulting the Wizard.\n"
        case "queen":
            return "\nThe Queen is a truly magnanimous lady and wife to the KING. The sweetest person in the entire KINGDOM, even if she isn’t sharpest edge in the armory. I’d hate to give her any unpleasant news. Good thing nothing bad ever happens in the castle.\n"
        case "wizard":
            return "\nThe Wizard is a really nice guy. He’s always looking out for the KING, skulking in dark corners and listening through key holes. He’s really got his back. They occasionally disagree about matters of state, but really, they’re the best of friends.\n"
        case "king's suite":
            return "\nThe King’s Suite? You don’t know where it is? Oh of course you don’t, you’re always scrubbing away in the feast hall. Hehe. Well, you’ll figure it out. Bye now!\n"
        case "quest":
            if !givenQuest {
                gameManager.incrementScore(10)
                givenQuest = true
                return "\nOh yes. Your quest, O mighty hero, is to… clean the KING'S SUITE because the usual guy, er, brave knight, has fallen ill-- er, been injured in the line of duty. Dear Lord, talking like this is tiring. How do you manage to keep this up? I’m bored now. Please LEAVE.\n"
            } else {
                return "\nDear Lord, talking like this is tiring. How do you manage to keep this up? I’m bored now. Please LEAVE.\n"
            }
        case "leave":
            if givenQuest {
                delegate?.transitionScene()
            } else {
                return "\nWhere are you going? Get back here! The Steward grabs you and forces you to stay.\n"
            }
            break
        default:
            return "\nYou just wasted my time, didn't I give you a QUEST?\n"
        }
        
        return ""
    }
}