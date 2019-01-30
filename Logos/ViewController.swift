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
    //Default Values
    var days = 10
    var water = 10 //In hours
    var textInfo = "You are lost alone in the great sands"
    var gameTurn = 240 //Each hour is a tick
    //Not changeable on restart
    var gameTile = ["Shack", "Nothing but Sand", "Oasis"]
    var uiToggle = true
    var restartGame = false
    
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
        if uiToggle {
            daysLeftLabel.isHidden = true
            waterLabel.isHidden = true
            uiToggle = false
        } else {
            daysLeftLabel.isHidden = false
            waterLabel.isHidden = false
            uiToggle = true
        }
    }
    
    //Player death screen
    func playerDied(of deathType: String) {
        textInfo = "You died of \(deathType)"
        hideUIToggle()
        travelButtonLabel.setTitle("Restart", for: .normal)
        restartGame = true
    }
    
    //Resets variables
    func restartGameFunc() {
        hideUIToggle()
        //Default Values
        days = 10
        water = 10
        textInfo = "You are lost alone in the great sands"
        gameTurn = 240
        travelButtonLabel.setTitle("Travel", for: .normal)
        updateLabels()
        restartGame = false
    }
    
    func nextLocation() {
        let rand = Int.random(in: 0...gameTile.count)
    }
    
    //Action on travel
    //Decrements water and gameturn values
    @IBAction func travelButton() {
        //If game needs to be restarted, restart game otherwise run as normal
        if restartGame == true {
            restartGameFunc()
        } else {
            water -= 1
            //Checks if water has run out
            if water <= 0 {
                playerDied(of: "Dehydration")
            }
            //Checks if one day has passed
            gameTurn -= 1
            if gameTurn % 24 == 0 {
                days -= 1
            }
            
            updateLabels()
        }
    }


}


