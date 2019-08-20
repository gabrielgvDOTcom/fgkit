//
//  MoreInterfaces.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/20/19.
//  Copyright (c) 2019 weeKG. All rights reserved.
//

import UIKit

enum MoreNavigationOption {
    case home
    case register
}
protocol MoreRouterInterface: RouterInterface {

    func navigate(to option: MoreNavigationOption)
}
protocol MoreViewInterface: ViewInterface {
}
protocol MorePresenterInterface: PresenterInterface {
}
protocol MoreInteractorInterface: InteractorInterface {
}
