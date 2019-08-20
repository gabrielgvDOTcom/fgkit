//
//  PresenterInterface.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/20/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

public protocol PresenterInterface: class {

    func viewDidLoad()
    func viewWillAppear(animated: Bool)
    func viewDidAppear(animated: Bool)
    func viewWillDisappear(animated: Bool)
    func viewDidDisappear(animated: Bool)
}
extension PresenterInterface {
    
    func viewDidLoad() {
        fatalError("Implementation pending...")
    }
    func viewWillAppear(animated: Bool) {
        fatalError("Implementation pending...")
    }
    func viewDidAppear(animated: Bool) {
        fatalError("Implementation pending...")
    }
    func viewWillDisappear(animated: Bool) {
        fatalError("Implementation pending...")
    }
    func viewDidDisappear(animated: Bool) {
        fatalError("Implementation pending...")
    }
}
