//
//  Log.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/21/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import Foundation

#if !RELEASE
public func debugLog(_ message: Any?, filename: NSString = #file, function: NSString = #function, line: Int = #line) {
    let printMessage = (message as AnyObject).description.removingPercentEncoding
    NSLog("[\(filename.lastPathComponent):\(line)] \(function) - %@", printMessage!)
}
public func alertLog(_ message: Any?, filename: NSString = #file, function: NSString = #function, line: Int = #line) {
    let alert = UIAlertController(title: "[\(filename.lastPathComponent):\(line)]", message: "\(function) - \(String(describing: message))", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    UIApplication.shared.keyWindow!.rootViewController?.present(alert, animated: true, completion: nil)
}
#else
public func debugLog(_ message: Any?, filename: NSString = #file, function: NSString = #function, line: Int = #line) {}
public func alertLog(_ message: Any?, filename: NSString = #file, function: NSString = #function, line: Int = #line) {}
#endif

public func aLog(_ message: Any?, filename: NSString = #file, function: NSString = #function, line: Int = #line) {
    let printMessage = (message as AnyObject).description.removingPercentEncoding
    NSLog("[\(filename.lastPathComponent):\(line)] \(function) - \(String(describing: printMessage))")
}
