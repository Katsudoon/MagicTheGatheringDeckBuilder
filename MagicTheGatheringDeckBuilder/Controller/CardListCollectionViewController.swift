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
    var rows: Int = 0

    var color = CardSearchParameter(parameterType: .colors, value: "")
    var cmc = CardSearchParameter(parameterType: .cmc, value: "")
    var setCode = CardSearchParameter(parameterType: .set, value: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     /*   magic.fetchCards([color,cmc,setCode]) {
            cards, error in
            DispatchQueue.main.async {

                if let error = error {
                    print(error)
                }
                for c in cards! {
                    self.cardList += [c]
                }
                self.test()
            }
            
        }
        return rows */
        return 5
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardDetail", for: indexPath) as! CardCollectionViewCell

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
                    }
                }
            }
        return cell
    }
}
