//
//  RunInteractor.swift
//  base
//
//  Created by Gabriel Gárate Vivanco on 7/23/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import Foundation

extension RunInteractor {
    
    @objc fileprivate func willShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            presenter?.scrollView(moveTo: UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0))
        }
    }
    @objc fileprivate func willHide(_ notification: Notification) {
        presenter?.scrollView(moveTo: .zero)
    }
}
class RunInteractor: RunProtocolInteractorInput {

    //MARK: - VARs
    var fetch: RunProtocolFetchInput?
    var presenter: RunProtocolInteractorOutput?

    //MARK: - Init
    init(fetch: RunProtocolFetchInput) {
        self.fetch = fetch
    }

    //MARK: - Functions
    //MARK: Interactor
    func setModule() {}
    func unsetModule() {}

    //MARK: Random
}

