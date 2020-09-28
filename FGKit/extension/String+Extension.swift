//
//  String+Extension.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/12/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

public extension String {
    
    var email: Bool {
        return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}").evaluate(with: self)
    }
    var length: Int {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).count
    }
    var price: String {
        return ((self.numbers as NSString).integerValue).toClpPrice
    }
    var numbers: String {
        var amountWithPrefix = self
        let regex = try! NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
        amountWithPrefix = regex.stringByReplacingMatches(in: amountWithPrefix, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count), withTemplate: "")
        return amountWithPrefix
    }
    var hideEmailPrefix: String {
       if self.contains("@") {
            let part = self.components(separatedBy: "@")
            let newText = String(repeating: "*", count: part[0].count)
            return newText + "@" + part[1]
       }
       return self
    }
    var hidePhonePrefix: String {
        return String(self.enumerated().map { index, char in
           return [0, 1, self.count - 1, self.count - 2].contains(index) ? char : "X"
        })
    }
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
    func width(_ font: UIFont) -> CGFloat {
        return self.size(withAttributes: [NSAttributedString.Key.font: font]).width
    }
    func localized(withComment comment: String) -> String {
        return NSLocalizedString(self, comment: comment)
    }
    func height(_ font: UIFont, _ padding: CGFloat = 0) -> CGFloat {
        let constraintRect = CGSize(width: width(font), height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(
            with: constraintRect,
            options: [.usesLineFragmentOrigin, .usesFontLeading],
            attributes: [NSAttributedString.Key.font: font],
            context: nil
        )
        return boundingBox.height + padding
    }
}
public extension NSMutableAttributedString {
    
    @discardableResult func normal(_ text: String) -> NSMutableAttributedString {
        let normal = NSAttributedString(string: text)
        append(normal)
        return self
    }
    @discardableResult func bold(_ text: String, font: UIFont) -> NSMutableAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [.font: font]
        let boldString = NSMutableAttributedString(string:text, attributes: attrs)
        append(boldString)
        return self
    }
}
