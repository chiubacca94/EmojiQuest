//
//  Item.swift
//  EmojiQuest
//
//  Created by Brittany Chiu on 4/11/16.
//  Copyright © 2016 IST446. All rights reserved.
//

import Foundation

class Item {
//    var Name : String?
    
    var itemDictionary: [String:Int] = [    // item in array dictionary
        "coin" : 0,
        "lock pick" : 1
    ]
    
    var items = [Int]()                  // Array of Items
    
    // Print Items in inventory (description)
    func getItems(item:String){
        print("\nYour items:\n")
        
        for(myKey, myValue) in itemDictionary{
            print("\(myKey) - \(items[myValue])\n")
        }
    }
    
    // Add an item
    func addItem(item:String){
        
        // Check if there is actually an item in the game's "item database"
        if (itemDictionary[item] == nil){
            print("Nothing added because it doesn't exist!")
        }
        else{
            if let newItem = itemDictionary[item] {
                items[newItem] += 1
            }
            
        }
    }
    
    // Use/Remove an item
    func removeItem(item:String){
        
        // Check if there is actually an item in the game's item database
        if(itemDictionary[item] == nil){
            print("\nNothing removed because it doesn't exist!")
        }
        else{
           if let rmItem = itemDictionary[item] {
            
                // Check if there are any items in the inventory
                if(items[rmItem] < 1){
                    print("\nNothing removed because you don't have any \(items[rmItem]) \n")
                }
                else{
                    items[rmItem] -= 1;
                }
                
            }
            else{
                items[deleteItem!] -= 1
            }
        }
    }
}