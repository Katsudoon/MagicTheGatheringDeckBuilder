//
//  CardDetailViewController.swift
//  MagicTheGatheringDeckBuilder
//
//  Created by alexis gauthier on 4/09/18.
//  Copyright © 2018 alexis gauthier. All rights reserved.
//

import UIKit
import RealmSwift

class CardDetailViewController: UIViewController {

    @IBOutlet weak var cardImageDetail: UIImageView!
    @IBOutlet weak var addButonImage: UIButton!
    @IBOutlet weak var deleteButonImage: UIBarButtonItem!
    
    var addDeckDetail = false
    var deleteDeckDetail = false
    let realm = try! Realm()
    var id = ""
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if addDeckDetail == false && deleteDeckDetail == false{
            addButonImage.alpha = 0
            addButonImage.isEnabled = false
            deleteButonImage.isEnabled = false
        }

        if deleteDeckDetail == false && addDeckDetail == true{
            deleteButonImage.isEnabled = false
        }
        
        if deleteDeckDetail == true && addDeckDetail == false{
            addButonImage.alpha = 0
            addButonImage.isEnabled = false
        }
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindToDeckDetailAdd" {
            let controller = segue.destination as! DeckDetailViewController
            let card = CardDB()
            try! realm.write {
                card.id = id
                card.image = UIImagePNGRepresentation(cardImageDetail.image!)
                controller.deck.cards.append(card)
            }
            
        } else {
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
