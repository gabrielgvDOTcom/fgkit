//
//  UINavigationController+Extension.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/20/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

public extension UINavigationController {
    
    func popRouter(_ router: BaseRouter, animated: Bool = true) {
        self.popToViewController(router.viewController, animated: animated)
    }
    func pushRouter(_ router: BaseRouter, animated: Bool = true) {
        self.pushViewController(router.viewController, animated: animated)
    }
    func setRootRouter(_ router: BaseRouter, animated: Bool = true) {
        self.setViewControllers([router.viewController], animated: animated)
    }
}
