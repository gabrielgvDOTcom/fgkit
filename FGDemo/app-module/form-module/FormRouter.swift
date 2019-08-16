//
//  FormRouter.swift
//  base
//
//  Created by Gabriel Gárate Vivanco on 7/23/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

class FormRouter: FormProtocolRouter {
    
    deinit {
        debugPrint(String(describing: self), "deinit")
    }

    var viewController: UIViewController {
        let view = FormView()
        let interactor = FormInteractor(fetch: FormFetch())
        let presenter = FormPresenter(interactor: interactor, router: self)
        let navigationController = UINavigationController(rootViewController: view)

        presenter.view = view
        view.presenter = presenter
        interactor.presenter = presenter

        return navigationController
    }
    
    func pushToRUNController(from view: UIViewController?, animated: Bool) {
        let controller = RunRouter.build()
        view?.navigationController?.pushViewController(controller, animated: animated)
    }

    /*var viewController: UIViewController?
    
    static func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "Form", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "FormStoryBoard") as! FormProtocolView & UIViewController
        let presenter: FormProtocolPresenter & FormProtocolInteractorOutput = FormPresenter()
        let interactor: FormProtocolInteractorInput = FormInteractor(fetch: FormFetch())
        let router: FormProtocolRouter = FormRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }*/
}
