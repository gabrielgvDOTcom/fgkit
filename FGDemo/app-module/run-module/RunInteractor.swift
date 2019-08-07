//
//  RunInteractor.swift
//  base
//
//  Created by Gabriel Gárate Vivanco on 7/23/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import Foundation

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

