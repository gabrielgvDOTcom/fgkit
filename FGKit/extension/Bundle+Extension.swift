//
//  Bundle+Extension.swift
//  FGKit
//
//  Created by Gabriel Gárate vivanco on 18-02-20.
//  Copyright © 2020 weeKG. All rights reserved.
//

private class __ {}

extension Bundle {

    static var current: Bundle {
        return Bundle(for: __.self)
    }
}
