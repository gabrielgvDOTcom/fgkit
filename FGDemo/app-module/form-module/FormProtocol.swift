//
//  FormInterfaces.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/20/19.
//  Copyright (c) 2019 weeKG. All rights reserved.
//

import UIKit

protocol FormRouterInterface: RouterInterface {
    
    func presentAlert(title: String, message: String)
}
protocol FormViewInterface: ViewInterface {
}
protocol FormPresenterInterface: PresenterInterface {
    
    func validate(run: String)
}
protocol FormInteractorInterface: InteractorInterface {
}
