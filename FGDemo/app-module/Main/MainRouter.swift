//
//  MainRouter.swift
//  FGDemo
//
//  Created by Gabriel Gárate Vivanco on 26-09-20.
//  Copyright © 2020 weeKG. All rights reserved.
//

import UIKit

final class MainRouter: BaseRouter {

    // MARK: - Private properties -
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)

    // MARK: - Module setup -
    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: MainView.self)
        super.init(viewController: moduleViewController)
        
        let interactor = MainInteractor()
        let presenter = MainPresenter(view: moduleViewController, interactor: interactor, router: self)
        moduleViewController.presenter = presenter
    }
    deinit {
        debugPrint("\(String(describing: self)) deinit")
    }
}
extension MainRouter: MainRouterInterface {}

