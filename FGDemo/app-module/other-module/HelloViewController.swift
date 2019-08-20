//
//  HelloViewController.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/20/19.
//  Copyright (c) 2019 weeKG. All rights reserved.
//

import UIKit

final class HelloViewController: UIViewController {

    // MARK: - Public properties -
    var presenter: HelloPresenterInterface!

    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func push(_ sender: UIButton) {
        presenter.push()
    }
}
extension HelloViewController: HelloViewInterface {
    
}
