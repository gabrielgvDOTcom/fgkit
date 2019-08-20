//
//  MorePresenter.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/20/19.
//  Copyright (c) 2019 weeKG. All rights reserved.
//

import UIKit

final class MorePresenter {

    // MARK: - Private properties -
    private unowned let view: MoreViewInterface
    private let interactor: MoreInteractorInterface
    private let wireframe: MoreRouterInterface

    // MARK: - Lifecycle -
    init(view: MoreViewInterface, interactor: MoreInteractorInterface, wireframe: MoreRouterInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}
extension MorePresenter: MorePresenterInterface {

    func viewDidLoad() {}
    func viewWillAppear(animated: Bool) {}
    func viewDidAppear(animated: Bool) {}
    func viewWillDisappear(animated: Bool) {}
    func viewDidDisappear(animated: Bool) {}
}
