//
//  UILabel+Extension.swift
//  base
//
//  Created by Gabriel Gárate Vivanco on 7/23/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

public extension UILabel {

    func style(_ style: Styled.Text) {
        self.font = style.font
        self.textColor = style.color
    }
}
