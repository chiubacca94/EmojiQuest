//
//  Forest.swift
//  EmojiQuest
//
//  Created by Emma Roudabush on 4/11/16.
//  Copyright © 2016 IST446. All rights reserved.
//

import Foundation

class Forest {
    static let sharedInstance = Forest()
    
    let story = Story.sharedInstance
    let woodsman = Woodsman.sharedInstance
    
    init() {
        
    }
    
    func parseEmoji(playerResponse: String) -> String {
        return ""
    }
}