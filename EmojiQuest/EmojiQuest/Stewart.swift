//
//  Stewart.swift
//  EmojiQuest
//
//  Created by Emma Roudabush on 4/11/16.
//  Copyright © 2016 IST446. All rights reserved.
//

import Foundation

class Stewart: NPC {
    static let sharedInstance = Stewart()
    var story_progression_count = 0
    
    override init() {
        super.init()
    }
    
    // Response function
    func utilityResponse(playerResponse: String) -> String {
        
        var response_char = "\n"
        
        while(story_progression_count < 3){
            if(story_progression_count == 0 && playerResponse == "Mop Floor"){
                response_char = "\nThanks! Now do this next task. Clean\n "
                story_progression_count += 1
                break;
            }
            else if(story_progression_count == 0){
                response_char = "\nLISTEN TO ME! (Type: Mop Floor)\n"
                break;
            }
            if(story_progression_count == 1 && playerResponse == "Clean"){
                response_char = "\nThanks! Now do this next task. (Serve Food)\n "
                story_progression_count += 1
                break;
            }
            else if (story_progression_count == 1){
                response_char = "\nLISTEN TO ME! (Type: Clean)\n"
                break;
            }
            if(story_progression_count == 2 && playerResponse == "Serve Food"){
                response_char = "Cool. GO to forest scnene"
                story_progression_count += 1
            }
            else if (story_progression_count == 2){
                response_char = "\nLISTEN TO ME! (Type: Serve Food)\n"
                break;
            }

            
            
        }
        
        while((story_progression_count>5) && (story_progression_count<15)){
        
        }
        
        return response_char
    }
    
    // not sure if necessary because it will be saved through the singleton instance
    func changeToEndStewert(){
        story_progression_count = 5
    }
    
    

}