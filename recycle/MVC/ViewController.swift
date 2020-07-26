//
//  ViewController.swift
//  recycle
//
//  Created by Sohom Dutta on 7/20/20.
//  Copyright © 2020 Sohom Dutta. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var recycleButton: UIButton!
    
    @IBOutlet weak var moneyButton: UIButton!
    
    @IBOutlet weak var locationButton: UIButton!
    
    
    @IBOutlet weak var communityButtons: UIButton!
    
    @IBOutlet weak var goalButton: UIButton!
    
    
    @IBAction func gotophotovc(_ sender: Any) {
        performSegue(withIdentifier: "segueToPhoto", sender: self)
    }
    
    @IBAction func goalTrack(_ sender: Any) {
        performSegue(withIdentifier: "goalSegue", sender: self)
    }
    @IBAction func goToCommunityVC(_ sender: Any) {
        performSegue(withIdentifier: "saveSegue", sender: self)
    }
    
    @IBAction func goToConversionVC(_ sender: Any) {
        performSegue(withIdentifier: "segueToConversion", sender: self)
        
    }
    
    @IBAction func seeAvailableLocations(_ sender: Any) {
        performSegue(withIdentifier: "mapLocSegue", sender: self)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        recycleButton.alpha = 0.75
        moneyButton.alpha = 0.75
        locationButton.alpha = 0.75
        communityButtons.alpha = 0.75
        goalButton.alpha = 0.75
        recycleButton.layer.cornerRadius = 5
        recycleButton.layer.borderWidth = 1
        moneyButton.layer.cornerRadius = 5
        moneyButton.layer.borderWidth = 1
        locationButton.layer.cornerRadius = 5
        locationButton.layer.borderWidth = 1
        communityButtons.layer.cornerRadius = 5
        communityButtons.layer.borderWidth = 1
        goalButton.layer.cornerRadius = 5
        goalButton.layer.borderWidth = 1
        
    }


    
}

