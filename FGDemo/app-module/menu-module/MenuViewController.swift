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
    
    @IBAction private func pushFormView(_ sender: Any) {
        presenter.pushFormView()
    }
}
extension MenuViewController: MenuViewInterface {
    
}
