//
//  PagePresenter.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/20/19.
//  Copyright (c) 2019 weeKG. All rights reserved.
//

import UIKit

final class PagePresenter {

    // MARK: - Private properties -
    private unowned let view: PageViewInterface
    private let interactor: PageInteractorInterface
    private let router: PageRouterInterface

    // MARK: - Lifecycle -
    init(view: PageViewInterface, interactor: PageInteractorInterface, router: PageRouterInterface) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    deinit {
        debugLog("\(String(describing: self)) deinit")
    }
}
extension PagePresenter: PagePresenterInterface {

    func viewDidLoad() {
        view.deliver(page: [FGPageEntity(title: "Hola", controller: FormRouter())])
    }
    func viewWillAppear(animated: Bool) {}
    func viewDidAppear(animated: Bool) {}
    func viewWillDisappear(animated: Bool) {}
    func viewDidDisappear(animated: Bool) {}
}
