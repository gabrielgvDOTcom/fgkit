//
//  MenuInterfaces.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/20/19.
//  Copyright (c) 2019 weeKG. All rights reserved.
//

import UIKit

enum MenuNavigationOption {

    case form
    case page
}
protocol MenuRouterInterface: RouterInterface {

    func navigate(to option: MenuNavigationOption)
    func showErrorAlert(message: String)
    func showActionAlert(title: String, message: String, actions: [FGAlertAction])
}
protocol MenuViewInterface: ViewInterface {
}
protocol MenuPresenterInterface: PresenterInterface {
    
    func pushFormView()
    func pushPageView()
}
protocol MenuInteractorInterface: InteractorInterface {
    
}
