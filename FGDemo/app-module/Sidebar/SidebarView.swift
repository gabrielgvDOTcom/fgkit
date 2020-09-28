//
//  SidebarView.swift
//  FGDemo
//
//  Created by Gabriel Gárate Vivanco on 27-09-20.
//  Copyright © 2020 weeKG. All rights reserved.
//

import UIKit

final class SidebarView: UIViewController {

    // MARK: - Public properties -
    var presenter: SidebarPresenterInterface!
    
    // MARK: - Private properties -

    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        //presenter.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - deinit -
    deinit {
        debugPrint("\(String(describing: self)) deinit")
    }
}
extension SidebarView: SidebarViewInterface {

    func showProgressHUD() {}
    func hideProgressHUD() {}
    func setViewTitle(_ title: String?) {}
    func setViewError(_ title: String?, message: String?) {}
}
