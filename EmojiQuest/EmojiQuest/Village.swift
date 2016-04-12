//
//  Village.swift
//  EmojiQuest
//
//  Created by Emma Roudabush on 4/11/16.
//  Copyright © 2016 IST446. All rights reserved.
//

import Foundation

class Village {
    static let sharedInstance = Village()
    
    let story = Story.sharedInstance
    
    init() {
        
    }
    
    func parseEmoji(playerResponse: String) -> String {
        return ""
    }
}