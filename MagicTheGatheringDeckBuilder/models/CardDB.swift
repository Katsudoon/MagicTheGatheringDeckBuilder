//
//  CardDB.swift
//  MagicTheGatheringDeckBuilder
//
//  Created by alexis gauthier on 11/09/18.
//  Copyright © 2018 alexis gauthier. All rights reserved.
//

import Foundation
import RealmSwift

class CardDB: Object {
    
    @objc dynamic var image: Data?
    @objc dynamic var id: String?

}

