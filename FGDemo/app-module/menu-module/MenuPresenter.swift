//
//  MenuPresenter.swift
//  base
//
//  Created by Gabriel Gárate Vivanco on 7/23/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

class MenuPresenter: MenuProtocolPresenter {

    //MARK: - VARs
    var view: MenuProtocolView?
    var router: MenuProtocolRouter?
    var interactor: MenuProtocolInteractorInput?
    
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
    func pushToRunController() {
        router?.pushToRunController()
    }
}
extension MenuPresenter: MenuProtocolInteractorOutput {
    
    //MARK: - Functions
    //MARK: Data
}
