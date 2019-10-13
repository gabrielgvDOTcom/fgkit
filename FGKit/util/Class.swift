//
//  Class.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 13-10-19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import Foundation

public protocol ClassNameProtocol {

    static var className: String { get }
    var className: String { get }
}
public extension ClassNameProtocol {

    static var className: String {
        return String(describing: self)
    }
    var className: String {
        return type(of: self).className
    }
}
extension NSObject: ClassNameProtocol {}
