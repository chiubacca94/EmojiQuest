//
//  Castle.swift
//  EmojiQuest
//
//  Created by Emma Roudabush on 4/11/16.
//  Copyright © 2016 IST446. All rights reserved.
//

import Foundation

protocol StoryManager {
    func transitionScene()
}

class Castle {
    static let sharedInstance = Castle()
    
//    let story = Story.sharedInstance
    let stewart = Stewart.sharedInstance
    let king = King.sharedInstance
    let queen = Queen.sharedInstance
    let knight = Knight.sharedInstance
    let wizard = Wizard.sharedInstance
    
    var currentNPC : NPC?
    var delegate : StoryManager?
    
    init() {
        // Set the inital NPC to the tutorial charcter
        currentNPC = stewart
    }
    
    func introductoryText(scene: StoryScene) -> String {
        switch (scene) {
        case StoryScene.TutorialCastleIntroduction:
            return "You were born into greatness. You are the latest in a long line of heroes who have saved the realm since time immemorial . Their legends are proclaimed in great halls and spoken of in hushed whispers alike. You ponder your great legacy as you continue to clean the feast hall. You still have to:"
        case StoryScene.TutorialCastleStewardConversation:
            return "You were born into greatness. You are the latest in a long line of heroes who have saved the realm since time immemorial . Their legends are proclaimed in great halls and spoken of in hushed whispers alike. You ponder your great legacy as you continue to clean the feast hall. You still have to:"
        case StoryScene.TutorialCastleHallways:
            return "'Man there are a lot of steps,' you think to yourself, 'I think this is the room I needed to go to.' You are in front of a door, it is cracked open."
        case StoryScene.TutorialKingsSuite:
            return "What happens in the king suite"
        case StoryScene.CastleFinalBoss:
            return "After all your effort, you've made it back to the castle."
        default:
            assert(false, "Invalid operation")
        }
    }
    

    func parseText(playerResponse: String, scene: StoryScene) -> String {
        var response: String = ""

        switch (currentNPC) {
        case is Stewart:
            response = stewart.respondTo(playerResponse)
            delegate?.transitionScene()
            currentNPC = nil
            break
        case is Wizard:
            response = wizard.respondTo(playerResponse)
            delegate?.transitionScene()
            
            break
        case is King:
            response = "\nKing talks\n"
            break
        default:
            return utilityResponse(playerResponse)
        }
        return response
    }
    
    func parseEmoji(playerResponse: String) -> String {
        var response: String = ""
        switch (currentNPC) {
        case is Stewart:
            response = stewart.respondTo(playerResponse)
            delegate?.transitionScene()
            break
        case is Knight:
            response = "\nKnight talks\n"
            break
        case is Queen:
            response = "\nQueen talks\n"
            break
        case is Wizard:
            response = "\nWizard talks\n"
            break
        case is King:
            response = "\nKing talks\n"
            break
        default:
            return utilityResponse(playerResponse)
        }
        return response
    }
    
    func utilityResponse(playerResponse: String) -> String {
       
        let response_char = "\ngi\n"
        // Check for item, look
        // Utility Response Text
        
        // Utility response emoji
        
        return response_char
    }
}