//
//  MenuRouter.swift
//  base
//
//  Created by Gabriel Gárate Vivanco on 7/23/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

class MenuRouter: MenuProtocolRouter {
    
    deinit {
        debugPrint(String(describing: self), "deinit")
    }

    var viewController: UIViewController {
        let view = MenuView()
        let interactor = MenuInteractor(fetch: MenuFetch())
        let presenter = MenuPresenter(interactor: interactor, router: self)
        let navigationController = UINavigationController(rootViewController: view)

        presenter.view = view
        view.presenter = presenter
        interactor.presenter = presenter

        return navigationController
    }
    
    func pushToFormController(from view: UIViewController?, animated: Bool) {
        let controller = FormRouter()
        view?.navigationController?.pushViewController(controller.viewController, animated: animated)
    }
}
