//
//  DeckListTableViewController.swift
//  MagicTheGatheringDeckBuilder
//
//  Created by alexis gauthier on 4/09/18.
//  Copyright © 2018 alexis gauthier. All rights reserved.
//

import UIKit

class DeckListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    @IBAction func addDeck(_ sender: Any) {
        performSegue(withIdentifier: "fromDeckListToDeckDetail", sender: self)
    }
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! DeckDetailCollectionViewController
        if let senderObject = sender {
            print(sender)
            
            if (senderObject as! UIBarButtonItem).tag == 1
            {
                controller.descriptionDeckEditable.text = ""
                controller.titleDeckEditable.text = ""
            }
            else
            {
                
            }
        }
        
    }
 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "deckCell", for: indexPath)

        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "fromDeckListToDeckDetail", sender: self)
        // let deck = Deck[indexPath.row]
    }
}
