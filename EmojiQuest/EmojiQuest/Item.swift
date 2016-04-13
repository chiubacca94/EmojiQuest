//
//  Item.swift
//  EmojiQuest
//
//  Created by Brittany Chiu on 4/11/16.
//  Copyright © 2016 IST446. All rights reserved.
//

import Foundation

class Item {
    var Name : String?
    
    var itemDictionary: [String:Int] = [    // item in array dictionary
        "coin" : 0,
        "lock pick" : 1
    ]
    
    var items = [Int]()                  // Array of Items
    
    // Print items in inventory
    func getItems(){
        print("Your items:")
        for (myKey, myValue) in itemDictionary {
            print ("\(myKey) - \(items[myValue]) \n")
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
        
        // Check if there is an item to remove
        if(itemDictionary[item] == nil){
            print("Nothing removed because it doesn't exist!")
        }
        else{
            // Check if you can remove an item (i.e. cannot have -1 if there are currently 0 items)
            let deleteItem = itemDictionary[item]
            
            if(items[deleteItem!] == 0){
                print("You currently don't have any of this")
            }
            else{
                items[deleteItem!] -= 1
            }
        }
    }
}