//
//  MenuPresenter.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/20/19.
//  Copyright (c) 2019 weeKG. All rights reserved.
//

import UIKit

final class MenuPresenter {

    // MARK: - Private properties -
    private unowned let view: MenuViewInterface
    private let interactor: MenuInteractorInterface
    private let router: MenuRouterInterface

    // MARK: - Lifecycle -
    init(view: MenuViewInterface, interactor: MenuInteractorInterface, router: MenuRouterInterface) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    deinit {
        debugLog("\(String(describing: self)) deinit")
    }
}
extension MenuPresenter: MenuPresenterInterface {

    func viewDidLoad() {}
    func viewWillAppear(animated: Bool) {}
    func viewDidAppear(animated: Bool) {}
    func viewWillDisappear(animated: Bool) {}
    func viewDidDisappear(animated: Bool) {}

    func pushFormView() {
        router.navigate(to: .form)
    }
}
