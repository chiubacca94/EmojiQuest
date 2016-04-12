//
//  Woodsman.swift
//  EmojiQuest
//
//  Created by Emma Roudabush on 4/11/16.
//  Copyright © 2016 IST446. All rights reserved.
//

import Foundation

enum WoodsmanState : String {
    case FoundPlayer = "foundPlayer"
    case Confused = "confused"
    case Willing = "willing"
}

class Woodsman: NPC {
    
    static let sharedInstance = Woodsman()
    
    var currentState : WoodsmanState = WoodsmanState.FoundPlayer
    let story = Story.sharedInstance
    
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
        if playerResponse.containsString("🌲") {
            currentState = .Confused
            return "Hurumph (He seems to like what you are doing)"
        } else {
            return "The Woodsman is staring at you"
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
            story.transitionSceneTo(StoryScene.Village)
            return "The Woodsman grabs your hand and starts leading you away."
        } else {
            return "The Woodsman is staring at you"
        }
    }
}