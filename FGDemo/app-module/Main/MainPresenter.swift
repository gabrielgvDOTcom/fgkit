//
//  MainPresenter.swift
//  FGDemo
//
//  Created by Gabriel Gárate Vivanco on 26-09-20.
//  Copyright © 2020 weeKG. All rights reserved.
//

import UIKit

final class MainPresenter {

    // MARK: - Private properties -
    private unowned let view: MainViewInterface
    private let interactor: MainInteractorInterface
    private let router: MainRouterInterface

    // MARK: - Lifecycle -
    init(view: MainViewInterface, interactor: MainInteractorInterface, router: MainRouterInterface) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    deinit {
        debugPrint("\(String(describing: self)) deinit")
    }
}
extension MainPresenter: MainPresenterInterface {

    func viewDidLoad() {}
    func viewWillAppear(animated: Bool) {}
    func viewDidAppear(animated: Bool) {}
    func viewWillDisappear(animated: Bool) {}
    func viewDidDisappear(animated: Bool) {}
}
