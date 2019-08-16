//
//  MenuInteractor.swift
//  base
//
//  Created by Gabriel Gárate Vivanco on 7/23/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import Foundation

class MenuInteractor: MenuProtocolInteractorInput {

    //MARK: - VARs
    private let fetch: MenuProtocolFetchInput
    weak var presenter: MenuProtocolInteractorOutput?

    //MARK: - Init
    init(fetch: MenuProtocolFetchInput) {
        self.fetch = fetch
    }
    deinit {
        debugPrint(String(describing: self), "deinit")
    }

    //MARK: - Functions
    //MARK: Interactor
    func setModule() {}
    func unsetModule() {}

    //MARK: Random
}

