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
    
    let steward = Steward.sharedInstance
    let king = King.sharedInstance
    let queen = Queen.sharedInstance
    let knight = Knight.sharedInstance
    let wizard = Wizard.sharedInstance
    
    let gameManager = GameManager.sharedInstance
    
    var didWash = false
    var didScrub = false
    var didDust = false
    
    var currentNPC : NPC?
    var delegate : StoryManager?
    
    var introductionMonologue = ["Your mindless drudge labor-- *ahem,* never ending war on uncleanliness helps-- keep you distracted so you don’t have to think about why you are here. Why is the latest scion of a family of legends scrubbing floors? As it turns out, “being a hero” isn’t a stable long term career choice.\n\n But back to work. What do you do next?", "\"Heroes\" are only necessary if the people are suffering. In the unprecedented period of peace and prosperity your country now enjoys, there is no work for a self-described \"hero.\" Ironically, in a thriving economy with jobs growing in all sectors, you found yourself out of work. Which is all fine and dandy because you didn’t have trouble finding a job to feed yourself, but for a person with no marketable skills besides self-aggrandizement, you find yourself working as a servant in the castle. Enough self-pity. What do you do next?", "Your new career would be all well and good, except that the other servants found out your lineage when someone on your first day asked why you were wearing a snakeskin fanny pack and you had to explain that it wasn’t a fanny pack, it was the Belt of Many Useful Pockets, crafted from the skin of the Fire Drakes from Hazelgloom mountain, slain by your great uncle Gerrick the Broad-Hafted and handed down through the generations till it reached your midriff. \n\n They’ve relentlessly mocked you ever since. \n\n But before you can finish your last task, the steward comes in, asking you to follow him to his office. A special Quest!? [Type Anything to Progress]"]
    
    var introductionMonologueIndex = -1
    
    init() {
        // Set the inital NPC to the tutorial charcter
        currentNPC = nil
    }
    
    func introductoryText(scene: StoryScene) -> String {
        switch (scene) {
        case StoryScene.TutorialCastleIntroduction:
            return "You still have to WASH the tables, SCRUB the floors, and DUST the trophies. What do you do?"
        case StoryScene.TutorialCastleStewardConversation:
            currentNPC = steward
            return "\nThe steward is your boss at the castle. He’s got a self important job title that basically means “head janitor” to cover up for his crippling lack of self-worth. Ignore him when he makes fun of you. He’s just jealous of your fashionable capes. \n\n “Welcome hero! We’ve need of your heroic might in a great quest. Peril approaches! You’re our only hope!” \n\n Your chest swells with pride. You knew this day would come. The steward seems to be in an especially good mood, you could probably ask him anything about the KINGDOM and he might even answer! Or you could just ask for details about your QUEST.\n"
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
        case is Steward:
            response = steward.respondTo(playerResponse)
            break
        case is Wizard:
            response = wizard.respondTo(playerResponse)
            delegate?.transitionScene()
            
            break
        case is King:
            response = "\nKing talks\n"
            break
        default:
            return utilityResponseText(playerResponse, scene: scene)
        }
        return response
    }
    
    func parseEmoji(playerResponse: String, scene: StoryScene) -> String {
        var response: String = ""
        switch (currentNPC) {
        case is Steward:
            response = "\nSteward talks\n"
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
            return utilityResponseEmoji(playerResponse, scene: scene)
        }
        return response
    }
    
    func utilityResponseText(playerResponse: String, scene: StoryScene) -> String {
        if (scene == .TutorialCastleIntroduction){
            return parseHallwayText(playerResponse)
        }
        return "bluh\n"
    }
    
    func utilityResponseEmoji(playerResponse: String, scene: StoryScene) -> String {
        
        let response_char = "\ngi\n"
        // Check for item, look
        // Utility Response Text
        
        // Utility response emoji
        
        return response_char
    }
    
    func parseHallwayText(playerResponse: String) -> String {
        let text = playerResponse.lowercaseString
        
        if (didDust && didScrub && didWash) {
            delegate?.transitionScene()
        }
        
        switch (text) {
            case "dust":
            if (didDust) {
                return "\nThere's something to be said about diligence, but this is just pushing it.\n"
            } else {
                introductionMonologueIndex++
                didDust = true
                gameManager.incrementScore(10)
                return "\nNumerous trophies decorate the walls from age-old victories against foreign armies and evil beasts, hard won by heroes of old. Now dust mites invade, seeking to sully the trophies’ luster. Back, foul bits of entropy!\n" + introductionMonologue[introductionMonologueIndex] + "\n"
            }
            case "wash":
            if (didWash) {
               return "\nThere's something to be said about diligence, but this is just pushing it.\n"
            } else {
                introductionMonologueIndex++
                didWash = true
                gameManager.incrementScore(10)
                return "\nYou elect to wash the tables. They are stained dark from years of the hearty feasting of heroes, leaving unacceptably unsanitary eating conditions. To the brush with it! Charge!!!\n" + introductionMonologue[introductionMonologueIndex] + "\n"
            }
            case "scrub":
            if (didScrub) {
               return "\nThere's something to be said about diligence, but this is just pushing it.\n"
            } else {
                introductionMonologueIndex++
                didScrub = true
                gameManager.incrementScore(10)
                return "\nThe floors are filthy from sticky spilt mead, your greatest foe, fearsome for its propensity to accumulate other grime on top of itself. Waver not, however, as you’ve armed yourself properly for the occasion with hearty lye soap and horsehair brush. Fearsome be the might of water based cleaning methods! *Scrub scrub scrub*\n"  + introductionMonologue[introductionMonologueIndex] + "\n"
            }
        default:
           return "\nWhat are you doing? You need to WASH, SCRUB, and DUST. Grime isn't just gonna un-grime itself.\n"
        }
    }
}