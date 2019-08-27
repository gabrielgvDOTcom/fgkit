//
//  MenuRouter.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/20/19.
//  Copyright (c) 2019 weeKG. All rights reserved.
//

import UIKit

final class MenuRouter: BaseRouter {

    // MARK: - Private properties -
    private let storyboard = UIStoryboard(name: "Menu", bundle: nil)

    // MARK: - Module setup -
    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: MenuViewController.self)
        super.init(viewController: moduleViewController)
        
        let interactor = MenuInteractor()
        let presenter = MenuPresenter(view: moduleViewController, interactor: interactor, router: self)
        moduleViewController.presenter = presenter
    }
    deinit {
        debugLog("\(String(describing: self)) deinit")
    }
}
extension MenuRouter: MenuRouterInterface {

    func navigate(to option: MenuNavigationOption) {
        switch option {
        case .form: form()
        case .page: page()
        }
    }

    private func form() {
        navigationController?.pushRouter(FormRouter())
    }
    private func page() {
        navigationController?.pushRouter(PageRouter())
    }
}
