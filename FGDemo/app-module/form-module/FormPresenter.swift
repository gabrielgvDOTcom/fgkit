//
//  FormPresenter.swift
//  base
//
//  Created by Gabriel Gárate Vivanco on 7/23/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

class FormPresenter: FormProtocolPresenter {

    //MARK: - VARs
    weak var view: FormView?
    var router: FormRouter
    var interactor: FormProtocolInteractorInput
    
    //MARK: - Init
    init(interactor: FormProtocolInteractorInput, router: FormRouter) {
        self.interactor = interactor
        self.router = router
    }
    deinit {
        debugPrint(String(describing: self), "deinit")
    }
    
    //MARK: - Functions
    //MARK: Notify
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
    func popController() {
        router.pop()
    }
    func pushToRunController() {
        router.pushToRUNController(from: view, animated: true)
    }
}
extension FormPresenter: FormProtocolInteractorOutput {
    
    //MARK: - Functions
    //MARK: Data
    func scrollView(moveTo inset: UIEdgeInsets) {
        view?.moveKeyboard(inset: inset)
    }
}
