//
//  String+Extension.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/12/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import Foundation

extension String {
    
    func email() -> Bool {
        return
            NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}")
                .evaluate(with: self)
    }
    func length() -> Int {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).count
    }
}
