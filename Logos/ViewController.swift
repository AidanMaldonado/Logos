//
//  ViewController.swift
//  Logos
//
//  Created by Aidan Maldonado on 1/30/19.
//  Copyright © 2019 Aidan Maldonado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Game Variables
    var days = 10
    var water = 10 //In hours
    var textInfo = "You are lost alone in the great sands"
    var gameTurn = 240 //Each hour is a tick
    var gameTile = ["Shack", "Nothing but Sand", "Oasis"]
    var uiToggle = true
    
    //Game Labels & Buttons
    @IBOutlet weak var daysLeftLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var waterLabel: UILabel!
    @IBOutlet weak var travelButtonLabel: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()
    }
    
    func updateLabels() {
        daysLeftLabel.text = "Days left: \(days)"
        infoLabel.text = textInfo
        waterLabel.text = "Water: \(water) hours"
    }
    
    //Determines the current UI toggle and hides or unhides the UI
    func hideUIToggle() {
        switch uiToggle {
        case uiToggle:
            daysLeftLabel.isHidden = true
            waterLabel.isHidden = true
            uiToggle = !uiToggle
        default:
            daysLeftLabel.isHidden = false
            waterLabel.isHidden = false
            uiToggle = !uiToggle
        }
    }
    
    //Player death screen
    func playerDied(deathType: String) {
        textInfo = "You died of \(deathType)"
        hideUIToggle()
        travelButtonLabel.setTitle("Restart", for: .normal)
    }
    
    @IBAction func travelButton() {
        water -= 1
        if water <= 0 {
            playerDied(deathType: "Dehydration")
        }
        //Checks if one day has passed
        gameTurn -= 1
        if gameTurn % 24 == 0 {
            days -= 1
        }
        updateLabels()
    }


}

