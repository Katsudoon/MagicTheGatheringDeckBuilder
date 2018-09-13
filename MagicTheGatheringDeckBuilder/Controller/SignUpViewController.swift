//
//  SignUpViewController.swift
//  MagicTheGatheringDeckBuilder
//
//  Created by alexis gauthier on 4/09/18.
//  Copyright © 2018 alexis gauthier. All rights reserved.
//

import UIKit
import RealmSwift

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var mailTextField: UITextField!
    
    let realm = try! Realm()
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func validateButton(_ sender: Any) {
        
        let nick = nicknameTextField.text
        let pass = passwordTextField.text
        let mail = mailTextField.text
        
        guard nick != "" else {
            return
        }
        guard pass != "" else {
            return
        }
        guard mail != "" else {
            return
        }

        let user = User()
        user.nickname = nick!
        user.password = pass!
        user.mail = mail!

        
        
    }
    
    

}
