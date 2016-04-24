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

class GameViewController: UIViewController, UITextFieldDelegate, InGameMenuProtocol  {

    @IBOutlet weak var playerInput: UITextField!
    @IBOutlet weak var gameText: UITextView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var delegate : GameViewProtocol?
    let gameManager = GameManager.sharedInstance
    let story = Story.sharedInstance
    let player = Player.sharedInstance
    
    var time = NSTimer()
    var time_interval = 0.3;

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.playerInput.delegate = self
        let center = NSNotificationCenter.defaultCenter()
        // New scene -- send notification (clear text and new scene)
        center.addObserver(self, selector: "newScene", name: StoryUpdateNotificationKey, object: nil)
        center.addObserver(self, selector: "updatedScore", name: ScoreUpdateNotificationKey, object: nil)
        center.addObserver(self, selector: "gameOver", name: GameOverNotificationKey, object: nil)
        // Have keyboard automatically appear
        playerInput.becomeFirstResponder()
        gameManager.newGame()
    }
    
    // must be internal or public.
    func update() {
        // Something cool
        
        
    }

    override func viewDidAppear(animated: Bool) {
        scoreLabel.text = String(gameManager.getScore())
        gameText.text = gameManager.newGameText() + "\n" + story.introductoryText() + "\n"
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
        dispatch_async(dispatch_get_main_queue(), {
            self.gameText.text = " "
            self.gameText.text = self.story.introductoryText()
        })
    }
    
    func updatedScore() {
        dispatch_async(dispatch_get_main_queue(), {
            self.scoreLabel.text = String(self.gameManager.getScore())
        })
    }
    
    func gameOver() {
        dispatch_async(dispatch_get_main_queue(), {
            self.gameText.text = " "
            self.gameText.text = self.gameManager.gameOverReason! + "\n\nEnter Text to return to Main Menu."
        })
    }
    
    // MARK: TextField Delegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if (gameManager.gameLost) {
            gameManager.newGame()
            story.newGame()
            delegate?.dismissView()
            return true
        }
        
        gameText.text = gameText.text + "'" + playerInput.text! + "'" + story.replyToText(playerInput.text!)
        playerInput.text = ""
      //   _ = NSTimer.scheduledTimerWithTimeInterval(0.4, target: self, selector: "update:", userInfo: nil, repeats: true)
        self.gameText.scrollRangeToVisible(NSMakeRange(-1, -1))
       
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
    
    @IBAction func infoButtonTouch(sender: AnyObject) {
        let alertVC = UIAlertController(title: "Feature Currently Not Implemented", message: "This would normally lead to the ability to save the game. However, due to prototype status, this feature has not been implemented.", preferredStyle: .Alert)
        
        
        let okAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        
        alertVC.addAction(okAction)
        alertVC.modalPresentationStyle = .FullScreen
        
        if let popoverController = alertVC.popoverPresentationController {
            popoverController.sourceView = view
            popoverController.sourceRect = view.bounds
        }
        self.presentViewController(alertVC, animated: true, completion: nil)
    }
}
