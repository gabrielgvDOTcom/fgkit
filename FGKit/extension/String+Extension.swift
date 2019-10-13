//
//  String+Extension.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/12/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import Foundation

public extension String {
    
    var email: Bool {
        return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}").evaluate(with: self)
    }
    var length: Int {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).count
    }
    var price: String {
        return ((self.numbers as NSString).integerValue).price
    }
    var numbers: String {
        var amountWithPrefix = self
        let regex = try! NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
        amountWithPrefix = regex.stringByReplacingMatches(in: amountWithPrefix, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count), withTemplate: "")
        return amountWithPrefix
    }

    func width(_ font: UIFont) -> CGFloat {
        return self.size(withAttributes: [NSAttributedString.Key.font: font]).width
    }
}
