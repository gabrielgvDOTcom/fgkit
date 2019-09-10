//
//  UIImageView+Extension.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 9/9/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import Kingfisher

public extension UIImageView {
    
    func remote(_ source: URL?, _ placeholder: UIImage?, radius: CGFloat? = 0, activity: Bool? = false) {
        self.layer.cornerRadius = radius ?? 0
        self.layer.masksToBounds = true
        if let load = activity, load {
            self.kf.indicatorType = .activity
        }
        self.kf.setImage(with: source, placeholder: placeholder, options: [.transition(.fade(1)), .cacheOriginalImage])
    }
}
