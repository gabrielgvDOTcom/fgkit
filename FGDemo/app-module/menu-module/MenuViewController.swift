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
    
    //private var alert: FGAlert?

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
    @IBAction func presentAlertView(_ sender: UIButton) {
        /*alert = FGAlert(title: "hola", message: "Que hace")
        alert?.addAction(FGAlertAction(title: "Cerrar", handler: .done))
        alert?.addAction(FGAlertAction(title: "Aceptar", handler: .action, {
            print("hola")
        }))
        alert?.present(container: self)*/
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
