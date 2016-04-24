//
//  Castle.swift
//  EmojiQuest
//
//  Created by Emma Roudabush on 4/11/16.
//  Copyright © 2016 IST446. All rights reserved.
//

import Foundation

class Castle : StoryManager {
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
    var wentNorth = false
    var wentEast = false
    var selectedBig = false
    var approachedCrackedDoor = false
    
    var currentNPC : NPC?
    var delegate : StoryManager?
    
    var introductionMonologue = ["Your mindless drudge labor-- *ahem,* never ending war on uncleanliness helps-- keep you distracted so you don’t have to think about why you are here. Why is the latest scion of a family of legends scrubbing floors? As it turns out, “being a hero” isn’t a stable long term career choice.\n\n But back to work. What do you do next?", "\"Heroes\" are only necessary if the people are suffering. In the unprecedented period of peace and prosperity your country now enjoys, there is no work for a self-described \"hero.\" Ironically, in a thriving economy with jobs growing in all sectors, you found yourself out of work. Which is all fine and dandy because you didn’t have trouble finding a job to feed yourself, but for a person with no marketable skills besides self-aggrandizement, you find yourself working as a servant in the castle. Enough self-pity. What do you do next?", "Your new career would be all well and good, except that the other servants found out your lineage when someone on your first day asked why you were wearing a snakeskin fanny pack and you had to explain that it wasn’t a fanny pack, it was the Belt of Many Useful Pockets, crafted from the skin of the Fire Drakes from Hazelgloom mountain, slain by your great uncle Gerrick the Broad-Hafted and handed down through the generations till it reached your midriff. \n\n They’ve relentlessly mocked you ever since. \n\n But before you can finish your last task, the steward comes in, asking you to follow him to his office. A special Quest!? [Press Enter to Progress]"]
    
    var introductionMonologueIndex = -1
    
    init() {
        // Set the inital NPC to the tutorial charcter
        currentNPC = nil
        steward.delegate = self
        wizard.delegate = self
    }
    
    func newGame() {
        currentNPC = nil
        introductionMonologueIndex = -1
        
        didWash = false
        didScrub = false
        didDust = false
        wentNorth = false
        wentEast = false
        selectedBig = false
        approachedCrackedDoor = false
        
        steward.newGame()
        wizard.newGame()
    }
    
    func transitionScene() {
        delegate?.transitionScene()
    }
    
    func introductoryText(scene: StoryScene) -> String {
        switch (scene) {
        case StoryScene.TutorialCastleIntroduction:
            return "You still have to WASH the tables, SCRUB the floors, and DUST the trophies. What do you do?"
        case StoryScene.TutorialCastleStewardConversation:
            currentNPC = steward
            return "\nThe steward is your boss at the castle. He’s got a self important job title that basically means “head janitor” to cover up for his crippling lack of self-worth. Ignore him when he makes fun of you. He’s just jealous of your fashionable capes. \n\n “Welcome hero! We’ve need of your heroic might in a great quest. Peril approaches! You’re our only hope!” \n\n Your chest swells with pride. You knew this day would come. The steward seems to be in an especially good mood, you could probably ask him anything about the KINGDOM and he might even answer! Or you could just ask for details about your QUEST.\n"
        case StoryScene.TutorialCastleHallways:
            currentNPC = nil
            return "\nYou’re in the hallway outside of the STEWARD’S OFFICE. The hallway extends NORTH and SOUTH. The Feast Hall lies to the SOUTH. What do you do?\n"
        case StoryScene.TutorialKingsSuite:
            currentNPC = nil
            return "\nYou arrive at the King’s suite.\n"
        case StoryScene.CastleFinalBoss:
            return "After all your effort, you've made it back to the castle."
        default:
            assert(false, "Invalid operation")
        }
    }
    

    func parseText(playerResponse: String, scene: StoryScene) -> String {
        var response: String = ""
        
        // Clean up and unify player response
        let text = playerResponse.lowercaseString.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet()
        )
        
        // Check for utility phrases
        if text.containsString("look") {
            return lookTextFor(scene)
        }
        
        // Base response on current NPC
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
            return noNPCResponseText(playerResponse, scene: scene)
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
            return noNPCResponseEmoji(playerResponse, scene: scene)
        }
        return response
    }
    
    func noNPCResponseText(playerResponse: String, scene: StoryScene) -> String {
        switch (scene) {
        case .TutorialCastleIntroduction:
            return parseCastleIntroText(playerResponse)
        case .TutorialCastleHallways:
            return parseHallwayText(playerResponse)
        case .TutorialKingsSuite:
            return parseKingsSuiteText(playerResponse)
        default:
            return "\nNot implemented yet.\n"
        }
    }
    
    func noNPCResponseEmoji(playerResponse: String, scene: StoryScene) -> String {
        return "\nNot implemented yet.\n"
    }
    
    func lookTextFor(scene: StoryScene) -> String {
        switch(scene){
        case .TutorialCastleIntroduction:
            return "\nYou look around the great hall of the castle and you notice its enormity. Trophies from great hunts hang on the walls and the floors are lined with tables where the King can entertain his guests.\n"
        case .TutorialCastleStewardConversation:
            return "\nThe steward’s office is a small room near the great hall. The walls are bare except for a small window on the far wall that only lets in a little bit of light.\n"
        case .TutorialCastleHallways:
            return "\nAll of these hallways look the same. It’s a wonder that more people don’t get lost walking in here.\n"
        case .TutorialKingsSuite:
            return "\nThe main room of the suite is a large open room adorned with the King’s possessions. On the far wall is PORTRAIT of the Kings and the Queen, on the wall to the left hangs the King’s GREATSWORD, and there is a CRACKED DOOR to the right from which you can hear voices.\n"
        default:
            return "\nsomething went really wrong... you shouldn't be here\n"
        }
    }
    
    // MARK: - Castle Intro Response
    func parseCastleIntroText(playerResponse: String) -> String {
        if (didDust && didScrub && didWash) {
            delegate?.transitionScene()
        }
        
        switch (playerResponse) {
            case "dust":
            if (didDust) {
                return "\nThere's something to be said about diligence, but this is just pushing it.\n"
            } else {
                introductionMonologueIndex++
                didDust = true
                gameManager.incrementScore(10)
                return "\nNumerous trophies decorate the walls from age-old victories against foreign armies and evil beasts, hard won by heroes of old. Now dust mites invade, seeking to sully the trophies’ luster. Back, foul bits of entropy!\n\n" + introductionMonologue[introductionMonologueIndex] + "\n"
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
    
    // MARK: - Castle Hallway Response
    func parseHallwayText(playerResponse: String) -> String {
        if (wentNorth && wentEast && selectedBig) {
            delegate?.transitionScene()
        }
        
        if wentNorth {
            if wentEast {
                switch(playerResponse) {
                case "big":
                    selectedBig = true
                    gameManager.incrementScore(30)
                    return "\nYeah...it's that one. [Press Enter to Advance]\n"
                case "left":
                    return "\nSeriously? You idiot, it’s obviously the BIG one!\n"
                case "right":
                    return "\nSeriously? You idiot, it’s obviously the BIG one!\n"
                default:
                    return "\nCome on. We all know you want to pick the BIG one. Stop messin' around.\n"
                }
            } else {
                switch(playerResponse) {
                case "west":
                    return "\nYou head west, going down a twisting series of hallways. Suddenly, you come around a corner and find yourself in the barracks! “Oh god, not here!” You think to yourself, and flee. Your socks wrinkle just remembering what happened last time you went in there. Not the socks! You head back\n"
                case "east":
                    wentEast = true
                    return "\nThe hallway becomes gradually richer and better lit. You find yourself at a dead end, with three doors in front of you. There’s one to your LEFT, one to the RIGHT, and a BIG, heavily decorated one straight ahead. I wonder which is one it is?\n"
                default:
                    return "\nWhat... are you doing? How about we try something else.\n"
                }
            }
        } else {
            switch(playerResponse) {
                case "steward’s office":
                    return "\nI think he’s done with you, best not to bother him again so soon.\n"
                case "north":
                    wentNorth = true
                    return "\nYou head North. This hallway ends and meets a bigger hallway going EAST and WEST. You know that these lead to different wings of the Castle, but you don’t know which is which.\n"
                case "south":
                    return "\nYou walk to the entrance of the Feast Hall. Your chest puffs with pride. Job well done. You’re a hero of the custodial arts! But you have other things to do right now. You head back.\n"
                default:
                    return "\nThat doesn't seem really helpful at this point.\n"
            }
        }
    }
    
    // MARK: - King's Suite Response
    func parseKingsSuiteText(playerResponse: String) -> String {
        switch(playerResponse) {
            case "portrait":
                return "\nThe portrait is a beautiful piece of art commissioned by the King as a gift to his wife to commemorate five happy years of marriage.\n"
            case "greatsword":
                return "\nThe King’s sword is the epitome of great work done by the smiths of the kingdom. Given to him on the day of his coronation, this sword has been used to slay many great monsters.\n"
            case "cracked door":
                if !approachedCrackedDoor {
                    approachedCrackedDoor = true
                    return "\nYou approach the door and you begin to recognize the voices as those of the King and the wizard. Do you try and LISTEN?\n"
                } else {
                    return "\nUh... I don't think you can get any closer to the cracked door.\n"
                }
            case "listen":
                if approachedCrackedDoor {
                    currentNPC = wizard
                    return "\nYou creep a little closer to the door. The occupants inside don't notice your presence. You hear the conversation...\n"
                } else {
                    return "\nYou hear a faint noise coming from the CRACKED DOOR. Were there to be people in the King's Suite while cleaning?\n"
                }
            default:
                return "\nWell you're here... why don't you LOOK around?\n"
        }
    }
}