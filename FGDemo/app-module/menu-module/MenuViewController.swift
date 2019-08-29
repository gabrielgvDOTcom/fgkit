//
//  MenuViewController.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/20/19.
//  Copyright (c) 2019 weeKG. All rights reserved.
//

import UIKit

final class MenuViewController: UIViewController {

    // MARK: - Public properties -
    var presenter: MenuPresenterInterface!

    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pushPageView(_ sender: UIButton) {
        presenter.pushPageView()
    }
    @IBAction private func pushFormView(_ sender: Any) {
        presenter.pushFormView()
    }

    // MARK: - deinit -
    deinit {
        debugLog("\(String(describing: self)) deinit")
    }
}
extension MenuViewController: MenuViewInterface {

    func showProgressHUD() {}
    func hideProgressHUD() {}
    func setViewTitle(_ title: String?) {}
    func setViewError(_ title: String?, message: String?) {}
}
