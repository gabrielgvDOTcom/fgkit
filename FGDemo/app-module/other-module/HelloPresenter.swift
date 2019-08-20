//
//  HelloPresenter.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/20/19.
//  Copyright (c) 2019 weeKG. All rights reserved.
//

import UIKit

final class HelloPresenter {

    // MARK: - Private properties -
    private unowned let view: HelloViewInterface
    private let interactor: HelloInteractorInterface
    private let wireframe: HelloRouterInterface

    // MARK: - Lifecycle -
    init(view: HelloViewInterface, interactor: HelloInteractorInterface, wireframe: HelloRouterInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}
extension HelloPresenter: HelloPresenterInterface {

    func viewDidLoad() {}
    func viewWillAppear(animated: Bool) {}
    func viewDidAppear(animated: Bool) {}
    func viewWillDisappear(animated: Bool) {}
    func viewDidDisappear(animated: Bool) {}

    func push() {
        wireframe.navigate(to: .home)
    }
}
