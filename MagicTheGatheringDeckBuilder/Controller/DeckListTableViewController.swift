//
//  DeckListTableViewController.swift
//  MagicTheGatheringDeckBuilder
//
//  Created by alexis gauthier on 4/09/18.
//  Copyright © 2018 alexis gauthier. All rights reserved.
//

import UIKit
import RealmSwift

class DeckListTableViewController: UITableViewController {
    
    @IBOutlet weak var addDeckButton: UIBarButtonItem!
    let realm = try! Realm()
    var delete = false
    var cellModif = false
    var choosedDeck = Deck()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    @IBAction func editButton(_ sender: Any) {
        if !delete {
            delete = true
            setEditing(true, animated: true)
        } else
        {
            delete = false
            setEditing(false, animated: true)
        }
        
    }
    
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if cellModif == true {
            let controller = segue.destination as! DeckDetailViewController
            controller.deck = choosedDeck
        }

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let decks = realm.objects(Deck.self)
        let count = decks.count
        
        if indexPath.row == count{
            cellModif = false
            performSegue(withIdentifier: "fromDeckListToDeckDetail", sender: self)
        }else{
            let deck = decks[indexPath.row]
            cellModif = true
            choosedDeck = deck
            performSegue(withIdentifier: "fromDeckListToDeckDetail", sender: self)
        }
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let decks = realm.objects(Deck.self)
        let count = decks.count + 1
        return count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let decks = realm.objects(Deck.self)
        let count = decks.count
        
        if indexPath.row == count{
            
            let cellAdd = tableView.dequeueReusableCell(withIdentifier: "deckCellAdd", for: indexPath) as! DeckTableViewCell
            return cellAdd
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "deckCell", for: indexPath) as! DeckTableViewCell
            
            let deck = decks[indexPath.row]
            cell.updateCell(with: deck.name, deckDescription: deck.descriptions)
            
            return cell
            
        }
        
    }
    
    override func tableView(_ tableView: UITableView,editingStyleForRowAt indexPath: IndexPath) ->
        UITableViewCellEditingStyle {
            let decks = realm.objects(Deck.self)
            let count = decks.count
            
            if indexPath.row == count{
                return .none
            }else{
                return .delete
            }
    }
    
    override func tableView(_ tableView: UITableView, commit
        editingStyle: UITableViewCellEditingStyle, forRowAt indexPath:
        IndexPath) {
        if editingStyle == .delete {
            let decks = realm.objects(Deck.self)
            let deck = decks[indexPath.row]
            try! realm.write {
                realm.delete(deck)
            }
            tableView.deleteRows(at: [indexPath], with: . automatic)
        }
    }
    
    @IBAction func unwindToDeckList(_ sender: UIStoryboardSegue) {

    }
}
