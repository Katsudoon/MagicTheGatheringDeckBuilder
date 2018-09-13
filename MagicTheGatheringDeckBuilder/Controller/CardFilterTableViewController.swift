//
//  CardFilterTableViewController.swift
//  MagicTheGatheringDeckBuilder
//
//  Created by alexis gauthier on 4/09/18.
//  Copyright © 2018 alexis gauthier. All rights reserved.
//

import UIKit

class CardFilterTableViewController: UITableViewController {
    
    @IBOutlet weak var cardColor: UITextField!
    @IBOutlet weak var cardValue: UITextField!
    @IBOutlet weak var cardSet: UITextField!
    
    var addDeckDetail = false

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func trouverButton(_ sender: Any) {
        performSegue(withIdentifier: "fromCardFilterToCardList", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! CardListCollectionViewController
        controller.addDeckDetail = addDeckDetail

        if let color = cardColor.text {
            controller.color.value = color.lowercased()
        } else {
            controller.color.value = ""
        }
        if let cmc = cardValue.text {
            controller.cmc.value = cmc.lowercased()
        } else {
            controller.cmc.value = ""
        }
        if let set = cardSet.text {
            controller.setCode.value = set.uppercased()
        } else {
            controller.setCode.value = ""
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
