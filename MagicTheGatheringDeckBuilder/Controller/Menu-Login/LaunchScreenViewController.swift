//
//  ViewController.swift
//  MagicTheGatheringDeckBuilder
//
//  Created by alexis gauthier on 29/08/18.
//  Copyright © 2018 alexis gauthier. All rights reserved.
//

import UIKit

class LaunchScreenViewController: UIViewController {
    
    @IBOutlet weak var titreLaunchScreen: UILabel!
    @IBOutlet weak var boutonLaunchScreen: UIButton!
    @IBOutlet weak var backgroundLaunchScreen: UIImageView!
    
    var button = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fondue(fadeViews: [backgroundLaunchScreen, boutonLaunchScreen, titreLaunchScreen], scaleViews: [boutonLaunchScreen, titreLaunchScreen], delai: 0, secondes: 0, options: .curveEaseInOut, alpha: 0, transform: 0.5, sender: button)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fondue(fadeViews: [backgroundLaunchScreen, boutonLaunchScreen, titreLaunchScreen], scaleViews: [boutonLaunchScreen, titreLaunchScreen], delai: 0, secondes: 3, options: .curveEaseInOut, alpha: 1, transform: 1, sender: button)
    }
    
    @IBAction func fromLaunchTomenuSegue(_ sender: Any) {
        button = "launch"
        fondue(fadeViews: [backgroundLaunchScreen, boutonLaunchScreen, titreLaunchScreen], scaleViews: [boutonLaunchScreen, titreLaunchScreen], delai: 0, secondes: 2, options: .curveEaseInOut, alpha: 0, transform: 1, sender: button)
    }
    
}

