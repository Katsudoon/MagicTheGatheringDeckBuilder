//
//  MenuViewController.swift
//  MagicTheGatheringDeckBuilder
//
//  Created by alexis gauthier on 4/09/18.
//  Copyright © 2018 alexis gauthier. All rights reserved.
//

import UIKit
import Firebase


class MenuViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //----Si user authentifié, go deck sinon go login----//
    
    @IBAction func createModifyDeck(_ sender: Any) {
        let user = Auth.auth().currentUser;
        if ((user) != nil) {
            performSegue(withIdentifier: "fromMenuToDeckViewSegue", sender: self)
        } else {
            performSegue(withIdentifier: "fromMenuToLoginSegue", sender: self)
        }
    }
    
    //----//
    
    @IBAction func shareDeck(_ sender: Any) {
        performSegue(withIdentifier: "fromMenuToMapSegue", sender: self)
    }
    
    @IBAction func unwindToMenu(_ sender: UIStoryboardSegue) {
    }
    
}
