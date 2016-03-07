//
//  InGameMenuViewController.swift
//  EmojiQuest
//
//  Created by Emma Roudabush on 3/7/16.
//  Copyright © 2016 IST446. All rights reserved.
//

import UIKit

protocol InGameMenuProtocol {
    func dismissMenu()
    func exitToMainMenu()
}

class InGameMenuViewController: UIViewController {

    var delegate : InGameMenuProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func saveAndQuitButtonPushed(sender: AnyObject) {
        // TODO
        delegate!.exitToMainMenu()
    }
    
    @IBAction func saveAndContinueButtonPushed(sender: AnyObject) {
        // TODO
        delegate!.dismissMenu()
    }
    
    @IBAction func doneButtonPressed(sender: AnyObject) {
        delegate!.dismissMenu()
    }
}
