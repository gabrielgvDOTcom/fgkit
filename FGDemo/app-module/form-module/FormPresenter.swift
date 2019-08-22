//
//  FormPresenter.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/20/19.
//  Copyright (c) 2019 weeKG. All rights reserved.
//

import UIKit

final class FormPresenter {

    // MARK: - Private properties -
    private unowned let view: FormViewInterface
    private let interactor: FormInteractorInterface
    private let router: FormRouterInterface

    // MARK: - Lifecycle -
    init(view: FormViewInterface, interactor: FormInteractorInterface, router: FormRouterInterface) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    deinit {
        debugLog("\(String(describing: self)) deinit")
    }
}
extension FormPresenter: FormPresenterInterface {

    func viewDidLoad() {}
    func viewWillAppear(animated: Bool) {}
    func viewDidAppear(animated: Bool) {}
    func viewWillDisappear(animated: Bool) {}
    func viewDidDisappear(animated: Bool) {}

    func validate(run: String) {
        FGForm([["field": run, "label": "RUT", "rules": [FGFormType.dni]]]).validate { (error) -> (Void) in
            if let error = error {
                self.router.presentAlert(title: "Error", message: error.localizedDescription)
                return
            }
        }
    }
}
