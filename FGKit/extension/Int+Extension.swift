//
//  Int+Extension.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 9/1/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import Foundation

public extension Int {
    
    var price: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.usesGroupingSeparator = true
        formatter.locale = Locale(identifier: "es_CL")
        return formatter.string(from: NSNumber(integerLiteral: self)) ?? "$0"
    }
}
