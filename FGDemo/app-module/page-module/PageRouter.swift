//
//  PageRouter.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/20/19.
//  Copyright (c) 2019 weeKG. All rights reserved.
//

import UIKit

final class PageRouter: BaseRouter {

    // MARK: - Private properties -
    private let storyboard = UIStoryboard(name: "Page", bundle: nil)

    // MARK: - Module setup -
    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: PageView.self)
        super.init(viewController: moduleViewController)
        
        let interactor = PageInteractor()
        let presenter = PagePresenter(view: moduleViewController, interactor: interactor, router: self)
        moduleViewController.presenter = presenter
    }
    deinit {
        debugLog("\(String(describing: self)) deinit")
    }
}
extension PageRouter: PageRouterInterface {}
