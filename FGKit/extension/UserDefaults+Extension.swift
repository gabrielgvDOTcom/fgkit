//
//  UserDefaults+Extension.swift
//  base
//
//  Created by Gabriel Gárate Vivanco on 7/25/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import Foundation

public extension UserDefaults {
    
    func set<T: Encodable>(codable: T, forKey key: String) {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(codable)
            let jsonString = String(data: data, encoding: .utf8)!
            //debugPrint("Saving \"\(key)\": \(jsonString)")
            self.set(jsonString, forKey: key)
        } catch {
            //debugPrint("Saving \"\(key)\" failed: \(error)")
        }
    }
    func codable<T: Decodable>(_ codable: T.Type, forKey key: String) -> T? {
        
        guard let jsonString = self.string(forKey: key) else { return nil }
        guard let data = jsonString.data(using: .utf8) else { return nil }
        let decoder = JSONDecoder()
        //debugPrint("Loading \"\(key)\": \(jsonString)")
        return try? decoder.decode(codable, from: data)
    }
}
