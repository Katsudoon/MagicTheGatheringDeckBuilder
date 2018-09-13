//
//  DeckTableViewCell.swift
//  MagicTheGatheringDeckBuilder
//
//  Created by alexis gauthier on 11/09/18.
//  Copyright © 2018 alexis gauthier. All rights reserved.
//

import UIKit
import MTGSDKSwift


class DeckTableViewCell: UITableViewCell {
    
    @IBOutlet weak var deckTitleCell: UILabel!
    @IBOutlet weak var deckDescriptionCell: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCell(with deckTitle: String?, deckDescription: String?) {
        
        
        
        if deckTitle == nil {
            deckTitleCell.text = "No title"
        }else {
            deckTitleCell.text = deckTitle
        }
        if deckDescription == nil {
            deckDescriptionCell.text = "No description"
        }else {
            deckDescriptionCell.text = deckDescription
        }
        
    }

}
