//
//  FormRouter.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/20/19.
//  Copyright (c) 2019 weeKG. All rights reserved.
//

import UIKit

final class FormRouter: BaseRouter {

    // MARK: - Private properties -
    private let storyboard = UIStoryboard(name: "Form", bundle: nil)

    // MARK: - Module setup -
    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: FormViewController.self)
        super.init(viewController: moduleViewController)
        
        let interactor = FormInteractor()
        let presenter = FormPresenter(view: moduleViewController, interactor: interactor, router: self)
        moduleViewController.presenter = presenter
    }
    deinit {
        debugLog("\(String(describing: self)) deinit")
    }
}
extension FormRouter: FormRouterInterface {

    func presentAlert(title: String, message: String) {
        presentErrorAlert(with: message)
    }
}
