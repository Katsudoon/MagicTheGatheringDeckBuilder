//
//  CardCollectionViewCell.swift
//  MagicTheGatheringDeckBuilder
//
//  Created by alexis gauthier on 4/09/18.
//  Copyright © 2018 alexis gauthier. All rights reserved.
//

import UIKit
import MTGSDKSwift

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cardImage: UIImageView!
    
    let imageArray = [#imageLiteral(resourceName: "King404"),#imageLiteral(resourceName: "goblin404"),#imageLiteral(resourceName: "Nicol404"),#imageLiteral(resourceName: "Blast404")]
    
    func updateCardImage(with cardImg: UIImage?) {
        if cardImg == nil {
            cardImage.image = imageArray.randomItem()
        }else {
            cardImage.image = cardImg
        }
    }
}
