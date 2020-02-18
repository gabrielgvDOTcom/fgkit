//
//  Bundle+Extensión.swift
//  FGKit
//
//  Created by Gabriel Gárate vivanco on 18-02-20.
//  Copyright © 2020 weeKG. All rights reserved.
//

extension Bundle {

    static var current: Bundle {

        class __ { }
        return Bundle(for: __.self)
    }
}
