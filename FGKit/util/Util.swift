//
//  Util.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 9/14/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import Foundation

public struct Util {
    
    public struct Integer {
        
        public static func formatToPrice(_ int: Int?) -> String {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.usesGroupingSeparator = true
            formatter.locale = Locale(identifier: "es_CL")
            if let price = formatter.string(from: NSNumber(integerLiteral: int ?? 0)) {
                return price
            }
            return "$0"
        }
    }
}
