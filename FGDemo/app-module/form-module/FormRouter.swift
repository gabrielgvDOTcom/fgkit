//
//  FormRouter.swift
//  base
//
//  Created by Gabriel Gárate Vivanco on 7/23/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

class FormRouter: FormProtocolRouter {
    
    var viewController: UIViewController {
        let view = FormView()
        let interactor = FormInteractor(fetch: FormFetch())
        let presenter = FormPresenter(interactor: interactor, router: self)
        //let navigationController = UINavigationController(rootViewController: view)

        presenter.view = view
        view.presenter = presenter
        interactor.presenter = presenter

        return view
    }

    init() {}
    deinit {
        debugPrint(String(describing: self), "deinit")
    }
    
    func pop() {
        
    }
    func pushToRUNController(from view: UIViewController?, animated: Bool) {
        //let controller = RunRouter.build()
        //view?.navigationController?.pushViewController(controller, animated: animated)
    }
}
