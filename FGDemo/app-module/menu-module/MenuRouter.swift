//
//  MenuRouter.swift
//  base
//
//  Created by Gabriel Gárate Vivanco on 7/23/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

class MenuRouter: MenuProtocolRouter {

    var viewController: UIViewController {
        let view = MenuView()
        let interactor = MenuInteractor(fetch: MenuFetch())
        let presenter = MenuPresenter(interactor: interactor, router: self)
        //let navigationController = UINavigationController(rootViewController: view)

        view.presenter = presenter
        presenter.view = view
        interactor.presenter = presenter

        return view
    }
    
    init() {}
    deinit {
        debugPrint(String(describing: self), "deinit")
    }
    
    func pushToFormController(from view: UIViewController?) {
        view?.navigationController?.pushViewController(FormRouter().viewController, animated: true)
    }
}
