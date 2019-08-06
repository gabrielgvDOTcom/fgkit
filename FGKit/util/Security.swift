//
//  Encrypted.swift
//  base
//
//  Created by Gabriel Gárate Vivanco on 7/26/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import CommonCrypto

/// Estructura Seguridad, funciones utiles para el manejo de encriptación de archivos y strings.
public struct Security {
    
    public static func digest(input: Data) -> Data {
        let digestLength = Int(CC_SHA256_DIGEST_LENGTH)
        var hash = [UInt8](repeating: 0, count: digestLength)
        input.withUnsafeBytes {
            _ = CC_SHA256($0.baseAddress, UInt32(input.count), &hash)
        }
        return Data(bytes: hash, count: digestLength)
    }
    public static func sha256(_ str: String) -> String {
        if let stringData = str.data(using: String.Encoding.utf8) {
            return hexStringFromData(digest(input: stringData))
        }
        return ""
    }
    public static func hexStringFromData(_ input: Data) -> String {
        return digest(input: input).map{ String(format: "%02hhx", $0)}.joined()
    }
}
