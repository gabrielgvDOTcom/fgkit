//
//  MoreRouter.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/20/19.
//  Copyright (c) 2019 weeKG. All rights reserved.
//

import UIKit

final class MoreRouter: BaseRouter {

    // MARK: - Private properties -
    private let storyboard = UIStoryboard(name: "More", bundle: nil)

    // MARK: - Module setup -
    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: MoreViewController.self)
        super.init(viewController: moduleViewController)
        
        let interactor = MoreInteractor()
        let presenter = MorePresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }
}
extension MoreRouter: MoreRouterInterface {

    func navigate(to option: MoreNavigationOption) {
    
    }
}
