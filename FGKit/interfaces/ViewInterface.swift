//
//  ViewInterface.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/20/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

public protocol ViewInterface: class {

    func showProgressHUD()
    func hideProgressHUD()
    func setViewTitle(_ title: String?)
}
extension ViewInterface {

    func showProgressHUD() {}
    func hideProgressHUD() {}
    func setViewTitle(_ title: String?) {}
}
