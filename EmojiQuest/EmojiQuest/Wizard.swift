//
//  Wizard.swift
//  EmojiQuest
//
//  Created by Emma Roudabush on 4/11/16.
//  Copyright © 2016 IST446. All rights reserved.
//

import Foundation

enum WizardState : String {
    case notSeenPlayer = "notSeenPlayer"
    case spottedPlayer = "seenPlayer"
}

class Wizard: NPC {
    static let sharedInstance = Wizard()
    
    var currentState : WizardState = .notSeenPlayer
    var attemptsMade = 0
    var introMonologued = false
    
    override init() {
        super.init()
    }
    
    override func newGame() {
        attemptsMade = 0
        introMonologued = false
        currentState = .notSeenPlayer
    }
    
    func respondTo(playerResponse: String) -> String {
        switch(currentState){
        case .notSeenPlayer:
            return parseTextBeforeSpotted(playerResponse)
        case .spottedPlayer:
            return parseTextAfterSpotted(playerResponse)
        }
    }
    
    func parseTextBeforeSpotted(playerResponse: String) -> String {
        let continuedSpeech = "\n\nThe Wizard - wearing the face of the King - swaggers out from the King’s bedchamber. His expression is lazy and unreadable. \"A servant? I thought I’d disposed of the man of who normally comes to clean today. They must have found a replacement. Well, no use in crying over spilt milk. Just have to make lemonade.\" The Wizard was well known for his fondness for mixing corny metaphors. \"Oh, it’s you! The one with the aspirations of a hero. Oh, well, no one’s going to miss you. I’ll just tell them you ran off on some quest. Oh, even better, you stole that sword.\" The Wizard waved a hand and the greatsword disappeared off the wall. \"Now, I think I’ll take your tongue so you can’t tell the truth to anyone, and send you far away. Any last words?\"\n"
        var response = ""
        
        if attemptsMade == 1 {
            currentState = .spottedPlayer
        }
        
        if playerResponse.containsString("fight") || playerResponse.containsString("attack") {
            attemptsMade++
            response = "\nUh, yeah, about that. You don’t really do that anymore. You’re currently a servant, not a hero, so it wouldn’t be appropriate to do anything heroic. RUN or HIDE!\n"
        } else if playerResponse.containsString("hide") {
            attemptsMade++
            response = "\nYou look around for anything to hide behind. You see an arm chair and quickly dive behind it. Wait this won’t work. You never were very good at hide and seek.\n"
        } else if playerResponse.containsString("run") {
            attemptsMade++
            response = "\nYou sprint for the door and it slams shut in front of you magically. Oops. There might be another entrance but you don’t know where. Time to try something else.\n"
        } else if playerResponse.containsString("sword") {
            attemptsMade++
            response = "\nUnfortunately, that greatsword is bolted to the walls.\n"
        } else {
            attemptsMade++
            response = "\nQuit wasting time! You have to do something! RUN or HIDE!\n"
        }
        
        if attemptsMade == 2 {
            response += continuedSpeech
        }
        
        return response
    }
    
    func parseTextAfterSpotted(playerResponse: String) -> String {
        if !introMonologued {
            introMonologued = true
            return "\n\"Very cute. Goodbye.\"\n"
        } else {
            delegate?.transitionScene()
            return "\n"
        }
    }
    
}