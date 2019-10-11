//
//  PageViewController.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/20/19.
//  Copyright (c) 2019 weeKG. All rights reserved.
//

import UIKit

final class PageView: UIViewController {

    // MARK: - Public properties -
    var presenter: PagePresenterInterface!

    private var pageView: FGPageView?
    
    @IBOutlet private weak var containerView: UIView!

    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()

        pageView = FGPageView()
        presenter.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - deinit -
    deinit {
        debugLog("\(String(describing: self)) deinit")
    }
}
extension PageView: PageViewInterface {

    func showProgressHUD() {}
    func hideProgressHUD() {}
    func setViewTitle(_ title: String?) {}
    func setViewError(_ title: String?, message: String?) {}

    func deliver(page: [FGPageEntity]) {
        pageView?.pages = page
        pageView?.present(in: containerView)
    }
}
