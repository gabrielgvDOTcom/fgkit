//
//  MenuProtocol.swift
//  base
//
//  Created by Gabriel Gárate Vivanco on 7/23/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

protocol MenuProtocolView: class {
    
    //MARK: - VARs
    var presenter: MenuProtocolPresenter? { get set }
    
    //MARK: - Functions
    //MARK: Data

    //MARK: Random
    func resume()
    func load(message: String?)

    func styled()
    func hideNavigation(hide: Bool)
}
protocol MenuProtocolInteractorInput: class {
    
    var presenter: MenuProtocolInteractorOutput? { get set }
    
    //MARK: - Functions
    //MARK: Interactor
    func setModule()
    func unsetModule()
    
    //MARK: Random
}
protocol MenuProtocolInteractorOutput: class {
    
}
protocol MenuProtocolPresenter: class {
    
    //MARK: - VARs
    var view: MenuProtocolView? { get set }
    var router: MenuProtocolRouter? { get set }
    var interactor: MenuProtocolInteractorInput? { get set }
    
    //MARK: - Functions
    //MARK: Notify
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
    
    //MARK: Transitions
    //MARK: Random
}
protocol MenuProtocolRouter: class {
    
    var viewController: UIViewController? { get set }
}
protocol MenuProtocolFetchInput: class {
    
    func get()
}
