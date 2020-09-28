//
//  UIContol+Extension.swift
//  weeKGKit
//
//  Created by Gabriel Gárate Vivanco on 2/21/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

public extension UIControl {
    
    func action(for controlEvents: UIControl.Event, _ closure: @escaping () -> ()) {
        let sleeve = ClosureSleeve(closure)
        addTarget(sleeve, action: #selector(ClosureSleeve.invoke), for: controlEvents)
        objc_setAssociatedObject(self, String(format: "[%d]", arc4random()), sleeve, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
}
