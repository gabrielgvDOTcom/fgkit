//
//  UImage+Extension.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 10/1/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import Foundation

public extension UIImageView {

    func style(_ style: Styled.Icon) {

        var img: UIImage?
        if let image = UIImage(named: style.name, in: Bundle(for: FGErrorView.self), compatibleWith: nil) {
            img = image
        } else {
            img = UIImage(named: style.name, in: Bundle.main, compatibleWith: nil)
        }
        self.image = img
        self.general(style)
    }
    fileprivate func general(_ style: Styled.Icon) {
        self.image = self.image?.withColor(color: style.color)
        self.frame = CGRect(x: 0, y: 0, width: style.size, height: style.size)
        self.contentMode = UIView.ContentMode.scaleAspectFit
    }
}
