//
//  MoreViewController.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/20/19.
//  Copyright (c) 2019 weeKG. All rights reserved.
//

import UIKit

final class MoreViewController: UIViewController {

    // MARK: - Public properties -
    var presenter: MorePresenterInterface!

    @IBOutlet weak var webView: UIWebView!
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        webView.loadRequest(URLRequest(url: URL(string: "https://www.chileestuyo.cl")!))
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        webView.loadHTMLString("", baseURL: nil)
    }
}
extension MoreViewController: MoreViewInterface {
    
}
