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
    weak var view: MenuView?
    var router: MenuRouter
    var interactor: MenuProtocolInteractorInput
    
    //MARK: - Init
    init(interactor: MenuProtocolInteractorInput, router: MenuRouter) {
        self.interactor = interactor
        self.router = router
    }
    deinit {
        debugPrint(String(describing: self), "deinit")
    }
    
    //MARK: - Functions
    //MARK: Notify
    func viewDidLoad() {
        view?.styled()
    }
    func viewWillAppear() {}
    func viewDidAppear() {
        interactor.setModule()
    }
    func viewWillDisappear() {
        interactor.unsetModule()
    }
    func viewDidDisappear() {}
    
    //MARK: Random
    //MARK: Transition
    func pushToRunController() {
        router.pushToFormController(from: view, animated: true)
    }
}
extension MenuPresenter: MenuProtocolInteractorOutput {
    
    //MARK: - Functions
    //MARK: Data
    func scrollView(moveTo inset: UIEdgeInsets) {
        view?.moveKeyboard(inset: inset)
    }
}
