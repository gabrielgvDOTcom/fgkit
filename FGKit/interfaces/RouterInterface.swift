//
//  RouterInterface.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/20/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

public protocol RouterInterface: class {}
public extension BaseRouter {
    
    var viewController: UIViewController {
        defer { _temporaryStoredViewController = nil }
        return _viewController
    }
    var navigationController: UINavigationController? {
        return viewController.navigationController
    }
}

open class BaseRouter {
    
    private unowned var _viewController: UIViewController
    private var _temporaryStoredViewController: UIViewController?
    
    public init(viewController: UIViewController) {
        _temporaryStoredViewController = viewController
        _viewController = viewController
    }
}
extension BaseRouter: RouterInterface {}
