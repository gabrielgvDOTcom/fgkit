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
        _viewController = viewController
        _temporaryStoredViewController = viewController
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
    func presentAlert(with title: String?, message: String?, actions: [UIAlertAction])
    func presentActionSheet(with title: String?, message: String?, actions: [UIAlertAction])

    func presentCustomAlert(with title: String?, message: String?, icon: UIImage?, actions: [FGAlertAction])
}
extension BaseRouter: RouterInterface {

    public func dismiss(animated: Bool) {
        navigationController?.dismiss(animated: animated)
    }
    public func popFromNavigationController(animated: Bool) {
        let _ = navigationController?.popViewController(animated: animated)
    }

    public func presentErrorAlert(with message: String?) {
        presentAlert(with: "Ha ocurrido un error", message: message)
    }
    public func presentAlert(with title: String?, message: String?, actions: [UIAlertAction] = []) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.isEmpty ?
            alert.addAction(UIAlertAction(title: Bundle.current.localizedString(forKey: "ok", value: nil, table: nil), style: .cancel)) :
            actions.forEach { alert.addAction($0) }
        navigationController?.present(alert, animated: true, completion: nil)
    }
    public func presentActionSheet(with title: String?, message: String?, actions: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        actions.forEach { alert.addAction($0) }
        navigationController?.present(alert, animated: true, completion: nil)
    }

    public func presentCustomAlert(with title: String?, message: String?, icon: UIImage? = nil, actions: [FGAlertAction] = []) {
        let alert = FGAlertController(title: title, message: message, icon: icon)
        alert.modalPresentationStyle = .overCurrentContext
        actions.isEmpty ?
            alert.addAction(FGAlertAction(title: Bundle.current.localizedString(forKey: "ok", value: nil, table: nil), style: .cancel)) :
            actions.forEach { alert.addAction($0) }
        navigationController?.present(alert, animated: true, completion: nil)
    }
}
