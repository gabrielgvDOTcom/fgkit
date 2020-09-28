//
//  SidebarRouter.swift
//  FGDemo
//
//  Created by Gabriel Gárate Vivanco on 27-09-20.
//  Copyright © 2020 weeKG. All rights reserved.
//

import UIKit

final class SidebarRouter: BaseRouter {

    // MARK: - Private properties -
    private let storyboard = UIStoryboard(name: "Sidebar", bundle: nil)

    // MARK: - Module setup -
    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: SidebarView.self)
        super.init(viewController: moduleViewController)

        let interactor = SidebarInteractor()
        let presenter = SidebarPresenter(view: moduleViewController, interactor: interactor, router: self)
        moduleViewController.presenter = presenter
    }
    deinit {
        debugPrint("\(String(describing: self)) deinit")
    }
}
extension SidebarRouter: SidebarRouterInterface {}
