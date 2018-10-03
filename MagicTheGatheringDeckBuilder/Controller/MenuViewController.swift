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

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createModifyDeck(_ sender: Any) {
        performSegue(withIdentifier: "fromMenuToLoginSegue", sender: self)
        //performSegue(withIdentifier: "fromMenuToDeckViewSegue", sender: self)
    }
    

    @IBAction func shareDeck(_ sender: Any) {
        performSegue(withIdentifier: "fromMenuToMapSegue", sender: self)
    }
    
    @IBAction func unwindeToMenu(_ sender: UIStoryboardSegue) {
        
    }

}
