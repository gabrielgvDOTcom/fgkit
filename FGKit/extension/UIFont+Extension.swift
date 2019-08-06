//
//  UIFont+Extension.swift
//  base
//
//  Created by Gabriel Gárate Vivanco on 7/23/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

public extension UIFont {

    convenience init(_ weight: UIFont.Weight, size: CGFloat) {
        var font: String! = ""
        switch weight {
        case .thin: font = "HelveticaNeue-Thin"
        case .light: font = "HelveticaNeue-Light"
        case .regular: font = "HelveticaNeue"
        case .medium: font = "HelveticaNeue-Medium"
        case .semibold: font = "HelveticaNeue-Medium"
        case .bold: font = "HelveticaNeue-Bold"
        case .black: font = "HelveticaNeue-Bold"
        case .heavy: font = "HelveticaNeue-Bold"
        default: font = "HelveticaNeue"
        }
        self.init(name: font, size: size)!
    }
}
