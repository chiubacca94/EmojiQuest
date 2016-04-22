//
//  Wizard.swift
//  EmojiQuest
//
//  Created by Emma Roudabush on 4/11/16.
//  Copyright © 2016 IST446. All rights reserved.
//

import Foundation

enum WizardState : String {
    case notSeenPlayer = "notSeenPlayer"
    case spottedPlayer = "seenPlayer"
}

class Wizard: NPC {
    static let sharedInstance = Wizard()
    
    override init() {
        super.init()
    }
    
    func respondTo(playerResponse: String) -> String {
        return "\nWizard Talks\n"
    }
}