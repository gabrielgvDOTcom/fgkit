//
//  SidebarPresenter.swift
//  FGDemo
//
//  Created by Gabriel Gárate Vivanco on 27-09-20.
//  Copyright © 2020 weeKG. All rights reserved.
//

import UIKit

final class SidebarPresenter {

    // MARK: - Private properties -
    private unowned let view: SidebarViewInterface
    private let interactor: SidebarInteractorInterface
    private let router: SidebarRouterInterface

    // MARK: - Lifecycle -
    init(view: SidebarViewInterface, interactor: SidebarInteractorInterface, router: SidebarRouterInterface) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    deinit {
        debugPrint("\(String(describing: self)) deinit")
    }
}
extension SidebarPresenter: SidebarPresenterInterface {

    func viewDidLoad() {}
    func viewWillAppear(animated: Bool) {}
    func viewDidAppear(animated: Bool) {}
    func viewWillDisappear(animated: Bool) {}
    func viewDidDisappear(animated: Bool) {}
}
