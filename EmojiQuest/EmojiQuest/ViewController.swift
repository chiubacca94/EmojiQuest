//
//  ViewController.swift
//  EmojiQuest
//
//  Created by Brittany Chiu on 3/2/16.
//  Copyright © 2016 IST446. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SettingsProtocol, GameViewProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissSettings() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func dismissView() {
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch segue.identifier! {
        case "showSettings":
            let settingsView = segue.destinationViewController as! SettingsViewController
            settingsView.delegate = self
            break
        case "startNewGame":
            let gameView = segue.destinationViewController as! GameViewController
            gameView.delegate = self
            break
        case "continueGame":
            let gameView = segue.destinationViewController as! GameViewController
            gameView.delegate = self
            break
        default:
            assert(false, "Invalid Segue")
        }
    }
}

