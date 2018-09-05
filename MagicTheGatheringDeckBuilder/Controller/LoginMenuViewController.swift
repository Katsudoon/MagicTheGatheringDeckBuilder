//
//  LoginViewController.swift
//  MagicTheGatheringDeckBuilder
//
//  Created by alexis gauthier on 30/08/18.
//  Copyright © 2018 alexis gauthier. All rights reserved.
//

import UIKit

class LoginMenuViewController: UIViewController {
    @IBOutlet weak var titreLogin: UILabel!
    @IBOutlet weak var texteLogin: UILabel!
    @IBOutlet weak var signupButtonLogin: UIButton!
    @IBOutlet weak var loginButtonLogin: UIButton!
    @IBOutlet weak var backgroundLogin: UIImageView!
    
    var nul = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fondue(fadeViews: [titreLogin, texteLogin, signupButtonLogin, loginButtonLogin], scaleViews: [titreLogin, texteLogin, signupButtonLogin, loginButtonLogin], delai: 0, secondes: 0, options: .curveEaseInOut, alpha: 0, transform: 0.5, sender: nul)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fondue(fadeViews: [titreLogin, texteLogin], scaleViews: [titreLogin, texteLogin], delai: 0, secondes: 1, options: .curveEaseInOut, alpha: 1, transform: 1, sender: nul)
        fondue(fadeViews: [signupButtonLogin, loginButtonLogin], scaleViews: [signupButtonLogin, loginButtonLogin], delai: 1, secondes: 1, options: .curveEaseInOut, alpha: 1, transform: 1, sender: nul)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}
