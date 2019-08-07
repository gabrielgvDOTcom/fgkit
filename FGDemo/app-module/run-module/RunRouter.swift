//
//  RunRouter.swift
//  base
//
//  Created by Gabriel Gárate Vivanco on 7/23/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

class RunRouter: RunProtocolRouter {
    
    var viewController: UIViewController?
    
    static func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "Run", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "RunStoryBoard") as! RunProtocolView & UIViewController
        let presenter: RunProtocolPresenter & RunProtocolInteractorOutput = RunPresenter()
        let interactor: RunProtocolInteractorInput = RunInteractor(fetch: RunFetch())
        let router: RunProtocolRouter = RunRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
