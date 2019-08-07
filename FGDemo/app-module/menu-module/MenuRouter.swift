//
//  MenuRouter.swift
//  base
//
//  Created by Gabriel Gárate Vivanco on 7/23/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

class MenuRouter: MenuProtocolRouter {
    
    var viewController: UIViewController?
    
    static func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "Menu", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "MenuStoryBoard") as! MenuProtocolView & UIViewController
        let presenter: MenuProtocolPresenter & MenuProtocolInteractorOutput = MenuPresenter()
        let interactor: MenuProtocolInteractorInput = MenuInteractor(fetch: MenuFetch())
        let router: MenuProtocolRouter = MenuRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }

    func pushToRunController() {
        viewController?.navigationController?.pushViewController(RunRouter.build(), animated: true)
    }
}
