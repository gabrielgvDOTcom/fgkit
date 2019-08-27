//
//  Field.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/12/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import ObjectMapper

class FGFormField: Mappable {

    var field: AnyObject!
    var label: String!
    var rules: [FGFormType] = []
    
    required init?(map: Map) {}
    func mapping(map: Map) {
        field <- map["field"]
        label <- map["label"]
        rules <- map["rules"]
    }
}
