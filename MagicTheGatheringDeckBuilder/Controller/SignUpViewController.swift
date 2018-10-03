//
//  SignUpViewController.swift
//  MagicTheGatheringDeckBuilder
//
//  Created by alexis gauthier on 4/09/18.
//  Copyright © 2018 alexis gauthier. All rights reserved.
//

import UIKit
import RealmSwift
import Firebase

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    let realm = try! Realm()
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func validateButton(_ sender: Any) {
        
        let pass = passwordTextField.text
        let mail = mailTextField.text
        
        guard pass != "" else {
            return
        }
        guard mail != "" else {
            return
        }

        Auth.auth().createUser(withEmail: mail!, password: pass!) { (authResult, error) in
            
            guard let user = authResult?.user else { return }
            
            self.performSegue(withIdentifier: "unwindToMenu", sender: self.signUpButton)
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    

}
