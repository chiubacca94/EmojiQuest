//
//  GameViewController.swift
//  EmojiQuest
//
//  Created by Emma Roudabush on 3/7/16.
//  Copyright © 2016 IST446. All rights reserved.
//

import UIKit

protocol GameViewProtocol {
    func dismissView()
}

class GameViewController: UIViewController, UITextFieldDelegate, InGameMenuProtocol {

    @IBOutlet weak var playerInput: UITextField!
    @IBOutlet weak var gameText: UITextView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var delegate : GameViewProtocol?
    let gameManager = GameManager.sharedInstance
    let story = Story.sharedInstance
    let player = Player.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.playerInput.delegate = self
        //let center = NSNotificationCenter.defaultCenter()
        //center.addObserver(self, selector: "newScene:", name: StoryUpdateNotificationKey, object: nil)
    }

    override func viewDidAppear(animated: Bool) {
        gameManager.newGame()
        scoreLabel.text = String(gameManager.getScore())
        gameText.text = gameManager.newGameText() + "/n" + story.introductoryText() + "/n"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func dismissMenu() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func exitToMainMenu() {
        dismissViewControllerAnimated(true, completion: nil)
        delegate!.dismissView()
    }
    
    func newScene() {
        gameText.text = story.introductoryText()
    }
    
    // MARK: TextField Delegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        gameText.text = gameText.text + playerInput.text! + story.replyToText(playerInput.text!)
        playerInput.text = ""
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch segue.identifier! {
        case "showInGameMenu":
            playerInput.resignFirstResponder()
            let menuView = segue.destinationViewController as! InGameMenuViewController
            menuView.delegate = self
            break
        default:
            assert(false, "Invalid Segue")
        }
    }

}
