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
    case PlayerUp = "playerUp"
    case AtCamp = "atCamp"
    case GettingWater = "gettingWater"
    case OtherActivities = "otherActivities"
}

class Woodsman: NPC {
    
    static let sharedInstance = Woodsman()
    let gameManager = GameManager.sharedInstance
    
    var currentState : WoodsmanState = WoodsmanState.FoundPlayer
    
    let positiveEmoji = ["😀", "😁", "☺️","😂","😃","😄","😅","😆","😊","😋", "😎","😹","😸", "😺", "🙆", "🙋", "🙌", "👍", "👌", "✋", "✌️", "🙏", "👆", "✊", "😇"]
    let negativeEmoji = ["😐", "😑", "😓", "😔", "😕", "😖", "😡", "😠"]
    let romanticEmoji = ["😉", "💋", "😍", "❤️", "💌", "👄", "😘", "😻", "😗", "😙", "😚", "😽", "💗", "💛"]
    let directionEmoji = ["➡️", "⬅️", "⬆️", "⬇️", "↗️", "↘️", "↙️", "↖️"]
    let foodAnimalEmoji = ["🐗", "🐟", "🍎", "🍏", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🍈", "🍒", "🍑", "🍍", "🍅", "🍆", "🌶", "🌽"]
    let plotEmoji = ["😈", "👿", "☠️", "🔮", "👑", "✨", "💀", "👻"]
    let woodsmanEmoji = ["🍻","❓","🍳","🍴","❓","💤","❔","🌲","🏡","🌲","⁉️"]
    let talkingEmoji = ["❔","⁉️","👂","🙋","👄", "💭", "❗️", "❓", "💬"]
    
    var didActivity = false
    var hasBow = false
    
    let talkingEmoji = ["🗯", "💭", "❗️", "❓", "💬"]
    
    override init() {
        super.init()
    }
    
    override func newGame() {
        currentState = WoodsmanState.FoundPlayer
        didActivity = false
    }
    
    func respondTo(playerResponse: String) -> String {
        if playerResponse == "👀" {
          return lookResponse()
        }
        
        switch (currentState) {
        case .FoundPlayer:
            return parseResponseIfFound(playerResponse)
        case .PlayerUp:
            return parseResponseIfPlayerUp(playerResponse)
        case .AtCamp:
            return parseResponseIfAtCamp(playerResponse)
        case .GettingWater:
            return parseResponseIfAfterGettingWater(playerResponse)
        case .OtherActivities:
            return parseResponseForAfterOtherActivities(playerResponse)
        }
    }
    
    func lookResponse() -> String {
        switch (currentState) {
        case .FoundPlayer:
            return "\nYou look around the forest and all you can see are trees in every direction and there is a gruff looking woodsman standing over you. You envy his magnificent beard...but do not envy the immense grime all over his person.\n"
        case .PlayerUp:
            return "\nAfter being helped up by the Woodsman, you notice that the trees around you look familiar. You must be close to the castle. Or they are just trees. Who knows?\n"
        case .AtCamp, .OtherActivities:
            return "\nlLooking around the woodsman’s camp you realize that he must live a very simple existence because the camp has very few luxuries. You feel a mix of sympathy and disgust looking at it all.\n"
        case .GettingWater:
            return "\nYou notice a worn path to a well where the Woodsman wants you to get water from....maybe?\n"
        }
    }
    
    func parseResponseIfFound(playerResponse: String) -> String {
        let continuingText = "You look around and get your bearings. You’re in a thickly wooded forest, characteristic of the King’s Woods, just a few miles away from the castle. Well, this could’ve been a lot worse, you reason. You must get back to the castle to depose the evil Wizard and regain your voice as quickly as possible! But wait, the Woodsman seems to be trying to communicate with you, with a series of grunts and gestures. Mysterious. \n\n \"🍻❓🍳🍴❓💤❔🌲🏡🌲⁉️\" What do you respond?\n"
        
        if positiveEmoji.contains(playerResponse) {
            currentState = .PlayerUp
            return "\nThe woodsman nods ...happily? And then he helps you up.\n\n" + continuingText
        } else if negativeEmoji.contains(playerResponse) {
            currentState = .PlayerUp
            return "\nThe woodsman frown deepens, slightly 😒. He glumly helps you to your feet.\n\n" + continuingText
        } else if romanticEmoji.contains(playerResponse) {
            gameManager.gameOver("The woodsman blushes, and then whacks you over the head. He must not appreciate such forward advances. Try being classier next time.")
            return "\n"
        } else {
            return "\nThe Woodsman just stares at you. I don't think that worked. Might want to try again.\n"
        }
    }
    
    func parseResponseIfPlayerUp(playerResponse: String) -> String {
        let continuingText = "After walking through the woods for several minutes, you come upon a camp clearly sized for just one person. A tiny cook fire smolders beside a waste-high tent. The woodsman sets something he was carrying over his shoulder beside the fire-- it’s a fresh rabbit! Seeing the animal, you realize you’re absolutely starving. The woodsman then pops into his tent and comes back with a small bucket. He gestures \"👉👤💧🌊🚰↗️\" He then turns back to the rabbit, clearly done with you for now. What do you do?\n"
        
        if positiveEmoji.contains(playerResponse) || woodsmanEmoji.contains(playerResponse) {
            currentState = .AtCamp
            return "\nHis frown lightens and he appears almost neutral. He beckons as he turns and heads away from the little clearing you woke up in, and you decide to follow.\n\n" + continuingText
        } else if negativeEmoji.contains(playerResponse) {
            currentState = .AtCamp
            return "\nHis frown temporarily deepens, and then he shrugs and begins to walk away. You feel no choice but to follow him. \n\n" + continuingText
        } else if romanticEmoji.contains(playerResponse) {
            gameManager.gameOver("The woodsman blushes, and then whacks you over the head. He must not appreciate such forward advances. Try being classier next time.")
            return "\n"
        } else {
            return "\nThe Woodsman just stares at you. I don't think that worked. Might want to try again.\n"
        }
    }
    
    func parseResponseIfAtCamp(playerResponse: String) -> String {
        let continuingText = "\nYou return to the camp with your water in hand. The woodsman is happily munching on roast rabbit. Your hunger only grows seeing it. He seems to be in a good mood now. You could ask for some food, or you could take this opportunity to ask how to get back to the Kingdom\n"
        
        if playerResponse == "↗️" {
            currentState = .GettingWater
            return "\nYou walk down the path to the well and collect water in the bucket to bring back to the camp.\n\n" + continuingText
        } else if directionEmoji.contains(playerResponse) {
            return "\nYou start heading confidently in a direction... but run into a tree. You head back to the Woodsman, rubbing your freshly acquired bruise\n"
        } else if talkingEmoji.contains(playerResponse) {
            return "\nClearly he wants you to fetch water before he lets you eat something and because you are starving you should probably do what he says.\n"
        } else {
            return "\nSo uh... maybe we should try to do something? Or we could just sit here. Sitting here is fun. Ooo... a squirrel just ran by!\n"
        }
    }
    
    func parseResponseIfAfterGettingWater(playerResponse: String) -> String {
        let continuingText = "\nAfter you get food, you go back and go to bed, having earned the woodsman’s respect. He’s going to guide you back to town tomorrow. [Press Enter to Continue]\n"
        
        if foodAnimalEmoji.contains(playerResponse) {
            currentState = .OtherActivities
            return "\nThe woodsman rubs his beard thoughtfully, seeming to understand exactly what you were saying. He asks \"🌲🌲🏡🌲🌲➡️➡️➡️⛪️🏠🏠🏠🏠❔\" You nod vigorously. He rubs his beard some more. Then he walks away and comes back shortly holding a small hunting bow. He says \"You get some for me, I get you there.\" You take the bow and stand up. You always were better at killing innocent animals than you were at fighting enemies. You head out into the woods to look for something.\n" + continuingText
        } else if plotEmoji.contains(playerResponse) {
            currentState = .OtherActivities
            return "\nThe woodsman hisses at you, making it clear you are not welcome to any of the food he has right now. Then he rubs his beard. Then he walks away and comes back shortly holding a small hunting bow. He says \"You want, you get yourself.\" You take the bow and stand up. You always were better at killing innocent animals than you were at fighting enemies. You head out into the woods to look for something to eat.\n" + continuingText
        } else {
            return "\nI mean I know it's been a rough day, but you gotta try something!\n"
        }

    }
    
    func parseResponseForAfterOtherActivities(playerResponse: String) -> String {
        gameManager.gameOver("Well that's it (for now)! Want to know what happens to our hero? Will he find his voice? Will he become the hero they all need? Will he get asked to the Prom? Probably not. Tune in next time to find out!")
        return ""
    }
}