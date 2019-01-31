//
//  BackPackViewController.swift
//  Logos
//
//  Created by Aidan Maldonado on 1/30/19.
//  Copyright © 2019 Aidan Maldonado. All rights reserved.
//

import UIKit

class BackPackViewController: UIViewController {
    
    //Game Variables
    var bagItems = ["", "", ""]
    
    //Labels
    @IBOutlet weak var itemOne: UIButton!
    @IBOutlet weak var itemTwo: UIButton!
    @IBOutlet weak var itemThree: UIButton!

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! ViewController
        destVC.bagItems = bagItems
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()
    }
    
    //Updates labels based on items
    func updateLabels() {
        itemOne.setTitle(bagItems[0], for: .normal)
        itemTwo.setTitle(bagItems[1], for: .normal)
        itemThree.setTitle(bagItems[2], for: .normal)
    }

}
