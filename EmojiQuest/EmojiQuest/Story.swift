//
//  Story.swift
//  EmojiQuest
//
//  Created by Emma Roudabush on 3/7/16.
//  Copyright © 2016 IST446. All rights reserved.
//

import Foundation

class Story {
    static let sharedInstance = Story()
    
    var isTutorial = true
    var scene = 1
    let forest = Forest.sharedInstance
    let village = Village.sharedInstance
    let castle = Castle.sharedInstance
    
    init() {
        
    }
    
    func endTutorial() {
        isTutorial = false // Reset tutorial in GameManager
    }
    
    func replyToText(playerResponse: String) -> String {
        if (isTutorial) {
            return parseText(playerResponse)
        } else {
            return parseEmoji(playerResponse)
        }
    }
    
    func parseText(playerResponse: String) -> String {
        switch (scene) {
        case 1:
            return castle.parseText(playerResponse, scene: scene)
        case 2:
            return castle.parseText(playerResponse, scene: scene)
        default:
            assert(false, "Invalid Actions")
            break
        }
    }
    
    func parseEmoji(playerResponse: String) -> String {
        switch (scene) {
        case 3:
            return forest.parseEmoji(playerResponse)
        case 4:
            return village.parseEmoji(playerResponse)
        case 5:
            return castle.parseEmoji(playerResponse)
        default:
            assert(false, "Invalid Actions")
            break
        }
    }
}