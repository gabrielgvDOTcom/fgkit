//
//  UIView+Extension.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/7/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import Foundation

public extension UIView {
    
    func style(_ style: Styled.View) {
        self.backgroundColor = style.bgColor
        self.layer.cornerRadius = style.cornerRadius
        self.layer.masksToBounds = true
    }
}
