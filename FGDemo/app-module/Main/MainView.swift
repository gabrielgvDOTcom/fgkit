//
//  MainView.swift
//  FGDemo
//
//  Created by Gabriel Gárate Vivanco on 26-09-20.
//  Copyright © 2020 weeKG. All rights reserved.
//

import UIKit

final class MainView: UIViewController {

    // MARK: - Public properties -
    var presenter: MainPresenterInterface!
    
    // MARK: - Private properties -

    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Action´s Buttons -
    @IBAction func menuAction(_ sender: UIBarButtonItem) {
        self.revealViewController()?.revealToggle(animated: true)
    }
    
    // MARK: - Private Functions -
    
    // MARK: - deinit -
    deinit {
        debugPrint("\(String(describing: self)) deinit")
    }
}
extension MainView: MainViewInterface {

    func showProgressHUD() {}
    func hideProgressHUD() {}
    func setViewTitle(_ title: String?) {}
    func setViewError(_ title: String?, message: String?) {}
}
