//
//  HelloRouter.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/20/19.
//  Copyright (c) 2019 weeKG. All rights reserved.
//

import UIKit

final class HelloRouter: BaseRouter {

    // MARK: - Private properties -
    private let storyboard = UIStoryboard(name: "Hello", bundle: nil)

    // MARK: - Module setup -
    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: HelloViewController.self)
        super.init(viewController: moduleViewController)
        
        let interactor = HelloInteractor()
        let presenter = HelloPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }
}
extension HelloRouter: HelloRouterInterface {

    func navigate(to option: HelloNavigationOption) {
        navigationController?.pushWireframe(MoreRouter(), animated: true)
    }
}
