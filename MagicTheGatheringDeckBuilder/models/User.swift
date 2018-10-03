//
//  User.swift
//  MagicTheGatheringDeckBuilder
//
//  Created by alexis gauthier on 10/09/18.
//  Copyright © 2018 alexis gauthier. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    
    @objc dynamic var password: String = ""
    @objc dynamic var mail: String = ""
}

