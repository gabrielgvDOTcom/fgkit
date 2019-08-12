//
//  Field.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/12/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import ObjectMapper

struct FGFormField {
    
    var field: AnyObject!
    var label: String!
    var rules: [FGFormType] = []
}
extension FGFormField: Mappable {

    init?(map: Map) {}
    mutating func mapping(map: Map) {

        self.field  <-  map["field"]
        self.label  <-  map["label"]
        self.rules  <-  map["rules"]
    }
}
