//
//  MenuProtocol.swift
//  base
//
//  Created by Gabriel Gárate Vivanco on 7/23/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

protocol MenuProtocolView {

    func resume()
    func load(message: String?)
    func styled()
    func hideNavigation(hide: Bool)
    func moveKeyboard(inset: UIEdgeInsets)
}
protocol MenuProtocolInteractorInput: class {

    func setModule()
    func unsetModule()
}
protocol MenuProtocolInteractorOutput: class {
    
    func scrollView(moveTo inset: UIEdgeInsets)
}
protocol MenuProtocolPresenter: class {

    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
    
    func pushToRunController()
}
protocol MenuProtocolRouter {

    var viewController: UIViewController { get }
}
protocol MenuProtocolFetchInput: class {
    
    func get()
}
