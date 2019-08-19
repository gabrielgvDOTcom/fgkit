//
//  FormInteractor.swift
//  base
//
//  Created by Gabriel Gárate Vivanco on 7/23/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import Foundation

class FormInteractor: FormProtocolInteractorInput {

    //MARK: - VARs
    private let fetch: FormProtocolFetchInput
    weak var presenter: FormProtocolInteractorOutput?

    //MARK: - Init
    init(fetch: FormProtocolFetchInput) {
        self.fetch = fetch
    }
    deinit {
        debugPrint(String(describing: self), "deinit")
    }

    //MARK: - Functions
    //MARK: Interactor
    //MARK: Random
}

