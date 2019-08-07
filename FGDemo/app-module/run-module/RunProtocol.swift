//
//  RunProtocol.swift
//  base
//
//  Created by Gabriel Gárate Vivanco on 7/23/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

protocol RunProtocolView: class {
    
    //MARK: - VARs
    var presenter: RunProtocolPresenter? { get set }
    
    //MARK: - Functions
    //MARK: Data

    //MARK: Random
    func resume()
    func load(message: String?)

    func styled()
    func hideNavigation(hide: Bool)
}
protocol RunProtocolInteractorInput: class {
    
    var presenter: RunProtocolInteractorOutput? { get set }
    
    //MARK: - Functions
    //MARK: Interactor
    func setModule()
    func unsetModule()
    
    //MARK: Random
}
protocol RunProtocolInteractorOutput: class {
    
}
protocol RunProtocolPresenter: class {
    
    //MARK: - VARs
    var view: RunProtocolView? { get set }
    var router: RunProtocolRouter? { get set }
    var interactor: RunProtocolInteractorInput? { get set }
    
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
protocol RunProtocolRouter: class {
    
    var viewController: UIViewController? { get set }
}
protocol RunProtocolFetchInput: class {
    
    func get()
}
