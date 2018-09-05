//
//  bla.swift
//  MagicTheGatheringDeckBuilder
//
//  Created by alexis gauthier on 30/08/18.
//  Copyright © 2018 alexis gauthier. All rights reserved.
//

import UIKit

extension Array {
    func randomItem() -> Element? {
        if isEmpty { return nil }
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
}

extension UIViewController {
    
    func fondue(fadeViews: [UIView], scaleViews: [UIView], delai: TimeInterval, secondes : TimeInterval, options:UIViewAnimationOptions,  alpha: CGFloat, transform: CGFloat, sender: String) {
        
                UIView.animate(withDuration: secondes, delay: delai, options: options, animations: {
                    for element in fadeViews {
                    element.alpha = alpha
                    }
                    for element in scaleViews {
                    element.transform = CGAffineTransform(scaleX: transform, y: transform)
                    }
                }, completion: {(Bool) -> Void in
                switch sender {
                case "launch": self.performSegue(withIdentifier: "fromLaunchToMenuSegue", sender: self)
                default: print("")
            }
        })
    }
}


