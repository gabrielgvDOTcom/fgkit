//
//  IntTransform.swift
//  weeKGKit
//
//  Created by Gabriel Gárate Vivanco on 2/5/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

/*import ObjectMapper

public class IntTransform: TransformType {

    public typealias Object = Int
    public typealias JSON = Any?

    public init() {}

    public func transformFromJSON(_ value: Any?) -> Int? {
        var result: Int?
        guard let json = value else {
            return result
        }
        
        if json is Int {
            result = (json as! Int)
        }
        if json is String {
            result = Int(json as! String)
        }
        
        return result
    }
    public func transformToJSON(_ value: Int?) -> Any?? {
        guard let object = value else {
            return nil
        }
        return String(object)
    }
}*/
