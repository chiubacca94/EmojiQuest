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

protocol StoryManager {
    func transitionScene()
}

class Story : StoryManager {
    
    static var sharedInstance = Story()
    
    private var isTutorial = true
    private var currentScene : StoryScene = .TutorialCastleIntroduction
    let forest = Forest.sharedInstance
    let village = Village.sharedInstance
    let castle = Castle.sharedInstance
    let gameManager = GameManager.sharedInstance
    
    init(){
        castle.delegate = self
        forest.delegate = self
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
            return castle.parseEmoji(playerResponse, scene: currentScene)
        default:
            assert(false, "Invalid Actions")
            break
        }
    }
    
    func transitionScene(){
        if (!gameManager.gameLost) {
            let newSceneValue = currentScene.rawValue + 1
            currentScene = StoryScene(rawValue: newSceneValue)!
        }
        // add notification for controller
        NSNotificationCenter.defaultCenter().postNotificationName(StoryUpdateNotificationKey, object: self)
    }
    
    func introductoryText() -> String {
        if (gameManager.gameLost) {
            return gameManager.gameOverReason! + "\n\nEnter Text to return to Main Menu."
        }
        
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