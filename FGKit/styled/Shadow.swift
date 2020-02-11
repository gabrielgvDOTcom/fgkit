//
//  StyledShadow.swift
//  FGKit
//
//  Created by Gabriel Gárate vivanco on 11-02-20.
//  Copyright © 2020 weeKG. All rights reserved.
//

import Foundation

open class ShadowStyle {
    
    let color: UIColor
    let opacity: Float
    let offSet: CGSize
    let radius: CGFloat
    let scale: Bool
    
    init(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        self.color = color
        self.opacity = opacity
        self.offSet = offSet
        self.radius = radius
        self.scale = scale
    }
}
