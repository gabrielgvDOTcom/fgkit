//
//  ads.swift
//  weeKGKit
//
//  Created by Gabriel Gárate Vivanco on 2/21/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

public class ClosureSleeve {

    //MARK: - VARs
    let closure: () -> ()

    //MARK: - Init
    init (_ closure: @escaping () -> ()) {
        self.closure = closure
    }

    //MARK: - Functions
    @objc func invoke () {
        closure()
    }
}
