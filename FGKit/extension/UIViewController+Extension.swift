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
    
    func presentWireframe(_ wireframe: BaseRouter, animated: Bool = true, completion: (() -> Void)? = nil) {
        present(wireframe.viewController, animated: animated, completion: completion)
    }
}
