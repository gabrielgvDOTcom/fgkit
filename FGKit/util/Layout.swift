//
//  Layout.swift
//  weeKGKit
//
//  Created by Gabriel Gárate Vivanco on 2/22/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit
import Foundation

struct FillConstraints {

    var top: NSLayoutConstraint!
    var left: NSLayoutConstraint!
    var bottom: NSLayoutConstraint!
    var right: NSLayoutConstraint!
}
public struct Layout {

    public static func fill(view: UIView, container: UIView? = nil) {
        let container: UIView! = container ?? UIApplication.shared.keyWindow?.subviews.last
        let top = NSLayoutConstraint(
            item: view,
            attribute: .top,
            relatedBy: .equal,
            toItem: container,
            attribute: .top,
            multiplier: 1.0,
            constant: 0.0
        )
        let right = NSLayoutConstraint(
            item: view,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: container,
            attribute: .trailing,
            multiplier: 1.0,
            constant: 0.0
        )
        let bottom = NSLayoutConstraint(
            item: view,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: container,
            attribute: .bottom,
            multiplier: 1.0,
            constant: 0.0
        )
        let left = NSLayoutConstraint(
            item: view,
            attribute: .leading,
            relatedBy: .equal,
            toItem: container,
            attribute: .leading,
            multiplier: 1.0,
            constant: 0.0
        )
        
        view.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(view)
        container.addConstraint(top)
        container.addConstraint(left)
        container.addConstraint(bottom)
        container.addConstraint(right)
        
        var constraints = FillConstraints()
        constraints.top = top
        constraints.left = left
        constraints.bottom = bottom
        constraints.right = right
    }
}
