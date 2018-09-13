//
//  CardListCollectionViewController.swift
//  MagicTheGatheringDeckBuilder
//
//  Created by alexis gauthier on 4/09/18.
//  Copyright © 2018 alexis gauthier. All rights reserved.
//

import UIKit
import MTGSDKSwift

private let reuseIdentifier = "Cell"

class CardListCollectionViewController: UICollectionViewController {
    
    let magic = Magic()
    var cardList: [Card] = []
    var rows: Int = 1
    var choosedImage = #imageLiteral(resourceName: "King404")
    var imageArray: [UIImage] = []
    var addDeckDetail = false
    var id = ""

    var color = CardSearchParameter(parameterType: .colors, value: "white")
    var cmc = CardSearchParameter(parameterType: .cmc, value: "1")
    var setCode = CardSearchParameter(parameterType: .set, value: "AER")

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if cardList.count == rows {
            print("deja loader")
        }else {
            magic.fetchCards([color,cmc,setCode]) {
                cards, error in
                DispatchQueue.main.async {
                    if let error = error {
                        print(error)
                    }
                    for c in cards! {
                        self.cardList += [c]
                    }
                    self.rows = self.cardList.count
                    
                    self.collectionView?.reloadData()
                }
                
            }
        }
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! CardDetailViewController
        controller.loadViewIfNeeded()
        controller.addDeckDetail = addDeckDetail
        controller.cardImageDetail.image = choosedImage
        controller.id = id
    }
 
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        choosedImage = imageArray[indexPath.row]
        id = cardList[indexPath.row].id!
        performSegue(withIdentifier: "fromCardListToCardDetail", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return rows
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardDetail", for: indexPath) as! CardCollectionViewCell

        if cell.cardImage.image == nil {
            magic.fetchCards([color,cmc,setCode]) {
                cards, error in
                DispatchQueue.main.async {
                    let card = cards![indexPath.row]
                    if let error = error {
                        print(error)
                    }
                    self.magic.fetchImageForCard(card) {
                        img, error in
                        if let error = error {
                            print(error)
                        }
                        cell.updateCardImage(with: img)
                        if img != nil {
                            self.imageArray.append(img!)
                        }
                        
                    }
                }
            }
        }
        

        return cell
    }
}
