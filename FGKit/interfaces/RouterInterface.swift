//
//  RouterInterface.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/20/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

open class BaseRouter {
    
    private unowned var _viewController: UIViewController
    private var _temporaryStoredViewController: UIViewController?
    
    public init(viewController: UIViewController) {
        _temporaryStoredViewController = viewController
        _viewController = viewController
    }
}
public extension BaseRouter {
    
    var viewController: UIViewController {
        defer { _temporaryStoredViewController = nil }
        return _viewController
    }
    var navigationController: UINavigationController? {
        return viewController.navigationController
    }
}

public protocol RouterInterface: class {

    func dismiss(animated: Bool)
    func popFromNavigationController(animated: Bool)

    func presentErrorAlert(with message: String?)
    func presentAlert(with title: String?, message: String?)
    func presentAlert(with title: String?, message: String?, actions: [UIAlertAction])

    func presentActionSheet(with title: String?, message: String?, actions: [UIAlertAction])
}
extension BaseRouter: RouterInterface {

    public func dismiss(animated: Bool) {
        navigationController?.dismiss(animated: true)
    }
    public func popFromNavigationController(animated: Bool) {
        let _ = navigationController?.popViewController(animated: animated)
    }

    public func presentErrorAlert(with message: String?) {
        let okAction = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
        presentAlert(with: "Ha ocurrido un error", message: message, actions: [okAction])
    }
    public func presentAlert(with title: String?, message: String?) {
        let okAction = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
        presentAlert(with: title, message: message, actions: [okAction])
    }
    public func presentAlert(with title: String?, message: String?, actions: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.forEach { alert.addAction($0) }
        navigationController?.present(alert, animated: true, completion: nil)
    }

    public func presentActionSheet(with title: String?, message: String?, actions: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        actions.forEach { alert.addAction($0) }
        navigationController?.present(alert, animated: true, completion: nil)
    }
}
