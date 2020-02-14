//
//  UIButton+Extension.swift
//  base
//
//  Created by Gabriel Gárate Vivanco on 7/29/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import Foundation

public extension UIButton {

    func style(_ style: Styled.Button) {
        self.backgroundColor = style.bgColor
        self.titleLabel?.font = style.font
        self.tintColor = style.tintColor
        self.setTitleColor(style.tintColor, for: .normal)
        self.layer.cornerRadius = style.cornerRadius
        self.layer.masksToBounds = true
    }
}
