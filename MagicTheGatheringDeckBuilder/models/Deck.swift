//
//  Deck.swift
//  MagicTheGatheringDeckBuilder
//
//  Created by alexis gauthier on 5/09/18.
//  Copyright © 2018 alexis gauthier. All rights reserved.
//

import Foundation
import UIKit
import MTGSDKSwift


struct Deck {
    
    public init() {}
    
    public var name: String?
    public var description: String?
    public var image: UIImage?
    public var cards: [Card]?
}
