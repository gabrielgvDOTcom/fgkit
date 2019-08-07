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
    var fetch: MenuProtocolFetchInput?
    var presenter: MenuProtocolInteractorOutput?
    
    //MARK: - Init
    init(fetch: MenuProtocolFetchInput) {
        self.fetch = fetch
    }
    
    //MARK: - Functions
    //MARK: Interactor
    func setModule() {}
    func unsetModule() {}
    
    //MARK: Random
}

