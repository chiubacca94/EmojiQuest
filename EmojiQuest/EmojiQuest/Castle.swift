

//
//  Castle.swift
//  EmojiQuest
//
//  Created by Emma Roudabush on 4/11/16.
//  Copyright © 2016 IST446. All rights reserved.
//

import Foundation

class Castle{
    static let sharedInstance = Castle()
    
//    let story = Story.sharedInstance
    
    var story_progression_count = 0;
    
    let stewart = Stewart.sharedInstance
    let king = King.sharedInstance
    let queen = Queen.sharedInstance
    let knight = Knight.sharedInstance
    let wizard = Wizard.sharedInstance
    var player_speech = ""
    var response_char = "\n"
    
    var currentNPC : NPC?
    
    init() {
        // Set the inital NPC to the tutorial charcter
        currentNPC = stewart
    }
    
    func introductoryText(scene: StoryScene) -> String {
        switch (scene) {
        case StoryScene.CastleTutorial:
            return "This is your life. These are your choices. You are scrubbing the floors."
        case StoryScene.CastleTurningPoint:
            return "'Man there are a lot of steps,' you think to yourself, 'I think this is the room I needed to go to.' You are in front of a door, it is cracked open."
        case StoryScene.CastleEnd:
            return "After all your effort, you've made it back to the castle."
        default:
            assert(false, "Invalid operation")
        }
    }
    

    func parseText(playerResponse: String, scene: StoryScene, NPC: curNPC) -> String {
        var response: String = ""
        
        player_speech = playerResponse
        switch (currentNPC) {
        case is Stewart:
            response = "\nStewert: Go mop the floor! (Type 'Mop Floor')\n"
            currentNPC = nil
            break
        case is Wizard:
            response = "\nWizard talks\n"
            break
        case is King:
            response = "\nKing talks\n"
            story_progression_count = 10
            break
        default:
            if(NPC == .Steward){
                return stewart.utilityResponse(playerResponse)
            }
            else if(NPC == .Woodsman){
                return ""
            }
        }
        return response
    }
    
    func parseEmoji(playerResponse: String) -> String {
        var response: String = ""
        switch (currentNPC) {
        case is Stewart:
            response = "\nStewart talks\n"
            stewart.utilityResponse(playerResponse)
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
       
        response_char = "\n"
        
//        while(story_progression_count < 3){
//            if(story_progression_count == 0 && playerResponse == "Mop Floor"){
//                response_char = "\nThanks! Now do this next task. Clean\n "
//                story_progression_count += 1
//                break;
//            }
//            else if(story_progression_count == 0){
//                response_char = "\nLISTEN TO ME! (Type: Mop Floor)\n"
//                break;
//            }
//            if(story_progression_count == 1 && playerResponse == "Clean"){
//                response_char = "\nThanks! Now do this next task. (Serve Food)\n "
//                story_progression_count += 1
//                break;
//            }
//            else if (story_progression_count == 1){
//                response_char = "\nLISTEN TO ME! (Type: Clean)\n"
//                break;
//            }
//            if(story_progression_count == 2 && playerResponse == "Serve Food"){
//                response_char = "Cool. GO to forest scnene"
//                story_progression_count += 1
//            }
//            else if (story_progression_count == 2){
//                response_char = "\nLISTEN TO ME! (Type: Serve Food)\n"
//                break;
//            }
//            
//            
//            
//        }
//        
//        while((story_progression_count>5) && (story_progression_count<15)){
//            
//        }
        
        return response_char
    }
}