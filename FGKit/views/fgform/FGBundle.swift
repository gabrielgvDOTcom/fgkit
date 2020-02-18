//
//  FGBundle.swift
//  FGKit
//
//  Created by Gabriel Gárate vivanco on 18-02-20.
//  Copyright © 2020 weeKG. All rights reserved.
//

import Foundation

class FGBundle {
    
    private var _bundle: Bundle
    
    init() {
        _bundle = Bundle(for: type(of: self))
    }

    func localized(key: String) -> String {
        _bundle.localizedString(forKey: key, value: nil, table: nil)
    }
}
