//
//  FormProtocol.swift
//  base
//
//  Created by Gabriel Gárate Vivanco on 7/23/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

protocol FormProtocolView {

    func resume()
    func load(message: String?)
    func styled()
    func hideNavigation(hide: Bool)
    func moveKeyboard(inset: UIEdgeInsets)
}
protocol FormProtocolInteractorInput: class {

    func setModule()
    func unsetModule()
}
protocol FormProtocolInteractorOutput: class {
    
    func scrollView(moveTo inset: UIEdgeInsets)
}
protocol FormProtocolPresenter: class {

    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
    
    func pushToRunController()
}
protocol FormProtocolRouter {

    var viewController: UIViewController { get }
}
protocol FormProtocolFetchInput: class {
    
    func get()
}
