//
//  FormViewController.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/20/19.
//  Copyright (c) 2019 weeKG. All rights reserved.
//

import UIKit

final class FormViewController: UIViewController {

    // MARK: - Public properties -
    var presenter: FormPresenterInterface!

    private var errorView: FGErrorView?
    //private var alert: FGAlert?

    // MARK: - IBOutlets -
    @IBOutlet private weak var runTextField: UITextField!
    @IBOutlet private weak var scrollView: UIScrollView!

    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerNotifications()
        
        /*alert = FGAlert(title: "hola", message: "Que hace")
        alert?.addAction(FGAlertAction(title: "Cerrar", handler: .done))
        alert?.addAction(FGAlertAction(title: "Aceptar", handler: .action, {
            print("hola")
        }))
        alert?.present(container: self)*/
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }

    // MARK: - Buttons -
    @IBAction private func validRUN(_ sender: UIButton) {
        presenter.validate(run: runTextField.text!)
    }
    @IBAction private func hideKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    // MARK: - Random -
    @objc private func _keyboardWillShow(_ notification: Notification) {
        guard let value = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: value.cgRectValue.height, right: 0)
    }
    @objc private func _keyboardWillHide(_ notification: Notification) {
        scrollView.contentInset = .zero
    }

    private func registerNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(_keyboardWillShow(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(_keyboardWillHide(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }

    // MARK: - deinit -
    deinit {
        debugLog("\(String(describing: self)) deinit")
    }
}
extension FormViewController: FGErrorDelegate {
    
    func retryOperation(errorView: FGErrorView) {
        errorView.remove()
    }
}
extension FormViewController: FormViewInterface {

    func showProgressHUD() {}
    func hideProgressHUD() {}
    func setViewTitle(_ title: String?) {}
    func setViewError(_ title: String?, message: String?) {}
}
