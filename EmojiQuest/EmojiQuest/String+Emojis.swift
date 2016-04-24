//
//  String+ContainsEmoji.swift
//  EmojiQuest
//
//  Created by Emma Roudabush on 4/22/16.
//  Copyright © 2016 IST446. All rights reserved.
//

import Foundation

extension String {
    var containsOnlyEmojis: Bool {
        for scalar in unicodeScalars {
            switch scalar.value {
            case 0x1F600...0x1F64F, // Emoticons
            0x1F300...0x1F5FF, // Misc Symbols and Pictographs
            0x1F680...0x1F6FF, // Transport and Map
            0x2600...0x26FF,   // Misc symbols
            0x2700...0x27BF,   // Dingbats
            0xFE00...0xFE0F,   // Variation Selectors
            0x1F900...0x1F9FF,
            0x1F600...0x1F64F:
                continue
            default:
                return false
            }
        }
        return true
    }
    
    var containsAnEmoji: Bool {
        for scalar in unicodeScalars {
            switch scalar.value {
            case 0x1F600...0x1F64F, // Emoticons
            0x1F300...0x1F5FF, // Misc Symbols and Pictographs
            0x1F680...0x1F6FF, // Transport and Map
            0x2600...0x26FF,   // Misc symbols
            0x2700...0x27BF,   // Dingbats
            0xFE00...0xFE0F,   // Variation Selectors
            0x1F900...0x1F9FF,
            0x1F600...0x1F64F:
                return true
            default:
                continue
            }
        }
        return false
    }
}