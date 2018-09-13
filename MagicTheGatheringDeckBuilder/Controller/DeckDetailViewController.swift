//
//  DeckDetailUIViewController.swift
//  MagicTheGatheringDeckBuilder
//
//  Created by alexis gauthier on 11/09/18.
//  Copyright © 2018 alexis gauthier. All rights reserved.
//

import UIKit
import RealmSwift

class DeckDetailViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var titleDeckEditable: UITextField!
    @IBOutlet weak var descriptionDeckEditable: UITextView!
    @IBOutlet weak var collection: UICollectionView!
    
    var deck = Deck()
    var modif = false
    var choosedImage = #imageLiteral(resourceName: "King404")
    var id = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleDeckEditable.text = deck.name
        descriptionDeckEditable.text = deck.descriptions
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collection.reloadData()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == deck.cards.count {
            performSegue(withIdentifier: "fromDeckDetailToCards", sender: self)
        }else {
            let data = deck.cards[indexPath.row].image
            choosedImage = UIImage(data: data!)!
            id = deck.cards[indexPath.row].id!
            performSegue(withIdentifier: "fromDeckDetailToCardsDetails", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromDeckDetailToCards" {
            let controller = segue.destination as! CardFilterTableViewController
            controller.addDeckDetail = true
        }else if segue.identifier == "fromDeckDetailToCardsDetails"{
            let controller = segue.destination as! CardDetailViewController
            controller.loadViewIfNeeded()
            controller.id = id
            controller.cardImageDetail.image = choosedImage
            controller.deleteDeckDetail = true
        }else {
            
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return deck.cards.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if indexPath.row == deck.cards.count{
         
            let cellAdd = collectionView.dequeueReusableCell(withReuseIdentifier: "deckDetailAdd", for: indexPath) as! CardCollectionViewCell
            return cellAdd
         
         } else {
         
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "deckDetail", for: indexPath) as! CardCollectionViewCell
            let data = deck.cards[indexPath.row].image
            let image = UIImage(data: data!)
            cell.updateCardImage(with: image)
            return cell
        }
    }

    @IBAction func validateButton(_ sender: Any) {
        let realm = try! Realm()
        if modif == false {
            try! realm.write {
                deck.name = titleDeckEditable.text!
                deck.descriptions = descriptionDeckEditable.text
                realm.add(deck)
            }
        }else{
            try! realm.write{
                deck.name = titleDeckEditable.text!
                deck.descriptions = descriptionDeckEditable.text
            }
        }
    
        performSegue(withIdentifier: "unwindSegueToDeckList", sender: self)
    }
    
    @IBAction func unwindToDeckDetailAdd(_ sender: UIStoryboardSegue) {
        
    }
    
    @IBAction func unwindToDeckDetailDelete(_ sender: UIStoryboardSegue) {
        
    }
    
}
