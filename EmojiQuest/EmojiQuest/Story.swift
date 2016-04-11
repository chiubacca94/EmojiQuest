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
    
    init() {
        
    }
    
    func endTutorial() {
        isTutorial = false // Reset tutorial in GameManager
    }
}