//
//  PageInterfaces.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/20/19.
//  Copyright (c) 2019 weeKG. All rights reserved.
//

import UIKit

protocol PageRouterInterface: RouterInterface {}
protocol PageViewInterface: ViewInterface {
    
    func deliver(page: UIView)
}
protocol PagePresenterInterface: PresenterInterface {}
protocol PageInteractorInterface: InteractorInterface {}
