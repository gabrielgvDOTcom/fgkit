//
//  UIViewController+Extension.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/20/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController {
    
    func presentRouter(_ router: BaseRouter, animated: Bool = true, completion: (() -> Void)? = nil) {
        present(router.viewController, animated: animated, completion: completion)
    }
}
