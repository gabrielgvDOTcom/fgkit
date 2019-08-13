//
//  MessageEntity.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 6/22/19.
//  Copyright © 2019 IONIX. All rights reserved.
//

import Foundation

struct FGMessage {
    
    var code: Int = 0
    var title: String = "AVISO"
    var description: String!
    var error: NSError {
        return NSError(
            domain: "cl.weekg.FGKit",
            code: code,
            userInfo: [NSLocalizedDescriptionKey: description!]
        )
    }

    init(code: Int) {
        self.code = code
        self.description = getDescriptionByCode(code)
    }
    init(description: String, title: String? = nil) {
        self.description = description
        if let str = title {
            self.title = str
        }
    }
    
    fileprivate func getDescriptionByCode(_ code: Int) -> String {
        return ""
    }
}
