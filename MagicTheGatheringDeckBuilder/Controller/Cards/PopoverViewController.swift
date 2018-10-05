//
//  PopoverViewController.swift
//  MagicTheGatheringDeckBuilder
//
//  Created by alexis gauthier on 2/10/18.
//  Copyright © 2018 alexis gauthier. All rights reserved.
//

import UIKit
import RealmSwift

class PopoverViewController: UIViewController {
    
    var addDeckDetail = false
    var deleteDeckDetail = false
    let realm = try! Realm()
    var id = ""
    var cardImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindToDeckDetailAdd" {
            let controller = segue.destination as! DeckDetailViewController
            let card = CardDB()
            try! realm.write {
                card.id = id
                card.image = UIImagePNGRepresentation(cardImage)
                controller.deck.cards.append(card)
            }
        }
        
        if segue.identifier == "unwindToDeckDetailDelete" {
            let controller = segue.destination as! DeckDetailViewController
            controller.loadViewIfNeeded()
            var idArray: [String] = []
            let cardArray = controller.deck.cards
            for c in cardArray {
                idArray.append(c.id!)
            }
            let index = idArray.index(of: id)
            try! realm.write {
                controller.deck.cards.remove(at: index!)
            }
        }
    }
    
    @IBAction func addSegue(_ sender: Any) {
        performSegue(withIdentifier: "unwindToDeckDetailAdd", sender: self)
    }
    
    @IBAction func deleteSegue(_ sender: Any) {
        performSegue(withIdentifier: "unwindToDeckDetailDelete", sender: self)
    }
    
}
