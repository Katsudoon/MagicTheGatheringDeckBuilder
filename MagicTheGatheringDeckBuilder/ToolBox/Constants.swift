//
//  Constants.swift
//  MagicTheGatheringDeckBuilder
//
//  Created by alexis gauthier on 10/09/18.
//  Copyright © 2018 alexis gauthier. All rights reserved.
//

import Foundation
struct Constants {
    
    static let MY_INSTANCE_ADDRESS = "magicapp.de1a.cloud.realm.io"
    
    static let AUTH_URL  = URL(string: "https://\(MY_INSTANCE_ADDRESS)")!
    static let REALM_URL = URL(string: "realms://\(MY_INSTANCE_ADDRESS)/ToDo")!
}
