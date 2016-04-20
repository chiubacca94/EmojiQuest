//
//  Story.swift
//  EmojiQuest
//
//  Created by Emma Roudabush on 3/7/16.
//  Copyright © 2016 IST446. All rights reserved.
//

import Foundation


enum StoryScene : Int {
    case TutorialCastleIntroduction = 1
    case TutorialCastleStewardConversation = 2
    case TutorialCastleHallways = 3
    case TutorialKingsSuite = 4
    case WoodsOutsideKingdom = 5
    case VillageOutsideCastle = 6
    case CastleFinalBoss = 7
}

class Story : StoryManager {
    
    static var sharedInstance = Story()
    
    private var isTutorial = true
    private var currentScene : StoryScene = .TutorialCastleIntroduction
    let forest = Forest.sharedInstance
    let village = Village.sharedInstance
    let castle = Castle.sharedInstance
    
    init(){
        castle.delegate = self
    }
    
    func endTutorial() {
        isTutorial = false // Reset tutorial in GameManager
    }
    
    func replyToText(playerResponse: String) -> String {
        // If in tutorial mode, can use text
        if (isTutorial) {
            return parseText(playerResponse)
        } else {
            return parseEmoji(playerResponse)
        }
    }
    
    func parseText(playerResponse: String) -> String {
        switch (currentScene) {
        case .TutorialCastleIntroduction:
            return castle.parseText(playerResponse, scene: currentScene)
        case .TutorialCastleStewardConversation:
            return castle.parseText(playerResponse, scene: currentScene)
        case .TutorialCastleHallways:
            return castle.parseText(playerResponse, scene: currentScene)
        case .CastleFinalBoss:
            return castle.parseText(playerResponse, scene: currentScene)
        default:
            assert(false, "Invalid Actions")
            break
        }
    }
    
    func parseEmoji(playerResponse: String) -> String {
        switch (currentScene) {
        case .WoodsOutsideKingdom:
            return forest.parseEmoji(playerResponse)
        case .VillageOutsideCastle:
            return village.parseEmoji(playerResponse)
        case .CastleFinalBoss:
            return castle.parseEmoji(playerResponse)
        default:
            assert(false, "Invalid Actions")
            break
        }
    }
    
    func transitionScene(){
        let newSceneValue = currentScene.rawValue + 1
        currentScene = StoryScene(rawValue: newSceneValue)!
        // add notification for controller
        NSNotificationCenter.defaultCenter().postNotificationName(StoryUpdateNotificationKey, object: self)
    }
    
    func introductoryText() -> String {
        switch (currentScene) {
        case .TutorialCastleIntroduction:
            return castle.introductoryText(currentScene)
        case .TutorialCastleStewardConversation:
            return castle.introductoryText(currentScene)
        case .TutorialCastleHallways:
            return castle.introductoryText(currentScene)
        case .TutorialKingsSuite:
            return castle.introductoryText(currentScene)
        case .CastleFinalBoss:
            return castle.introductoryText(currentScene)
        case .WoodsOutsideKingdom:
            return forest.introductoryText()
        case .VillageOutsideCastle:
            return village.introductoryText()
    }
 }


}