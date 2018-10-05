//
//  Deck.swift
//  MagicTheGatheringDeckBuilder
//
//  Created by alexis gauthier on 5/09/18.
//  Copyright © 2018 alexis gauthier. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift


class Deck: Object  {
    
    @objc dynamic var name: String = ""
    @objc dynamic var descriptions: String = ""
    var cards = RealmSwift.List<CardDB>()
    
}
