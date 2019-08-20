//
//  HelloInterfaces.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/20/19.
//  Copyright (c) 2019 weeKG. All rights reserved.
//

import UIKit

enum HelloNavigationOption {
    case home
    case register
}
protocol HelloRouterInterface: RouterInterface {

    func navigate(to option: HelloNavigationOption)
}
protocol HelloViewInterface: ViewInterface {
}
protocol HelloPresenterInterface: PresenterInterface {
    
    func push()
}
protocol HelloInteractorInterface: InteractorInterface {
}
