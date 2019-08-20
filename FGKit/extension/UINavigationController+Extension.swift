//
//  UINavigationController+Extension.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/20/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import Foundation
import UIKit

public extension UINavigationController {
    
    func pushWireframe(_ wireframe: BaseRouter, animated: Bool = true) {
        self.pushViewController(wireframe.viewController, animated: animated)
    }
    func setRootWireframe(_ wireframe: BaseRouter, animated: Bool = true) {
        self.setViewControllers([wireframe.viewController], animated: animated)
    }
}
