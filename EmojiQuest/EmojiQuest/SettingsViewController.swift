//
//  SettingsViewController.swift
//  EmojiQuest
//
//  Created by Emma Roudabush on 3/7/16.
//  Copyright © 2016 IST446. All rights reserved.
//

import UIKit

protocol SettingsProtocol {
    func dismissSettings()
}

class SettingsViewController: UIViewController {

    var delegate : SettingsProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func applyButtonPressed(sender: AnyObject) {
        // TODO: Apply any settings
        delegate!.dismissSettings()
    }
    
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        delegate!.dismissSettings()
    }
}
