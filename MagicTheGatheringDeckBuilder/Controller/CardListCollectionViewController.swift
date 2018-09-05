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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
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
    


    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
