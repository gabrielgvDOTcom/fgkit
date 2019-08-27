//
//  FGPageEntity.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/27/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import Foundation

open class FGPageEntity {

    var title: String = ""
    var controller: BaseRouter
    var view: UIView {
        return controller.viewController.view
    }

    public init(title: String, controller: BaseRouter) {
        self.title = title
        self.controller = controller
    }
}
