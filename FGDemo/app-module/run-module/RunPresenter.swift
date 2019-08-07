//
//  RunPresenter.swift
//  base
//
//  Created by Gabriel Gárate Vivanco on 7/23/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

class RunPresenter: RunProtocolPresenter {

    //MARK: - VARs
    var view: RunProtocolView?
    var router: RunProtocolRouter?
    var interactor: RunProtocolInteractorInput?
    
    //MARK: - Functions
    //MARK: Notify
    func viewDidLoad() {
        view?.styled()
    }
    func viewWillAppear() {}
    func viewDidAppear() {
        interactor?.setModule()
    }
    func viewWillDisappear() {
        interactor?.unsetModule()
    }
    func viewDidDisappear() {}
    
    //MARK: Random
    //MARK: Transition
}
extension RunPresenter: RunProtocolInteractorOutput {
    
    //MARK: - Functions
    //MARK: Data
}
