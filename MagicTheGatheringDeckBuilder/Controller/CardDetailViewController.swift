//
//  CardDetailViewController.swift
//  MagicTheGatheringDeckBuilder
//
//  Created by alexis gauthier on 4/09/18.
//  Copyright © 2018 alexis gauthier. All rights reserved.
//

import UIKit
import RealmSwift

class CardDetailViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    @IBOutlet weak var cardImageDetail: UIImageView!
    @IBOutlet weak var deleteButonImage: UIBarButtonItem!
    
    var addDeckDetail = false
    let realm = try! Realm()
    var id = ""
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if addDeckDetail == false {
            deleteButonImage.isEnabled = false
        }

        if addDeckDetail == true{
            deleteButonImage.isEnabled = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "popoverSegue" {
            let popoverViewController = segue.destination as! PopoverViewController
            popoverViewController.modalPresentationStyle = UIModalPresentationStyle.popover
            popoverViewController.popoverPresentationController!.delegate = self
            popoverViewController.cardImage = cardImageDetail.image
            popoverViewController.id = id
        }
        
    }
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    
    @IBAction func unwindToCardDetail(_ sender: UIStoryboardSegue) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
