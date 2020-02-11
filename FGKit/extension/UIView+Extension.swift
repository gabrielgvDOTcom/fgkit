//
//  UIView+Extension.swift
//  FGKit
//
//  Created by Gabriel Gárate vivanco on 11-02-20.
//  Copyright © 2020 weeKG. All rights reserved.
//

public extension UIView {
    
    func style(_ style: Styled.View) {
        self.backgroundColor = style.bgColor
        self.layer.cornerRadius = style.cornerRadius
        self.layer.masksToBounds = true
        
        if let shadow = style.shadow {
            layer.masksToBounds = false
            layer.shadowColor = shadow.color.cgColor
            layer.shadowOpacity = shadow.opacity
            layer.shadowOffset = shadow.offSet
            layer.shadowRadius = shadow.radius

            layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
            layer.shouldRasterize = true
            layer.rasterizationScale = shadow.scale ? UIScreen.main.scale : 1
        }
    }

    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1

        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius

        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
