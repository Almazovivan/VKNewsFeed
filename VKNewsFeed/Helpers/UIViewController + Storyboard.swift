//
//  UIViewController + Storyboard.swift
//  VKNewsFeed
//
//  Created by Ivan Almazov on 15/01/2021.
//  Copyright (c) 2021 Ivan Almazov. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    class func loadFromStoryboard<T: UIViewController>() -> T {
        let name = String(describing: T.self)
        let storyboard = UIStoryboard(name: name, bundle: nil)
        if let viewController = storyboard.instantiateInitialViewController() as? T {
            return viewController
        } else {
            fatalError("Error: No initial view controller in \(name) storyboard!")
        }
    }
    
}
