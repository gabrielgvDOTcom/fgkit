//
//  DateFormatTransform.swift
//  micopiloto
//
//  Created by Gabriel Gárate Vivanco on 3/8/19.
//  Copyright © 2019 IONIX. All rights reserved.
//

/*import Foundation
import ObjectMapper

public class DateFormatTransform: TransformType {

    public typealias Object = Date
    public typealias JSON = Double
    
    var dateFormat = DateFormatter()
    
    public convenience init(_ format: String) {
        self.init()
        self.dateFormat.dateFormat = format
    }
    public func transformFromJSON(_ value: Any?) -> Date? {
        if let timeInt = value as? Double {
            return Date(timeIntervalSince1970: TimeInterval(timeInt))
        }
        if let timeStr = value as? String {
            return self.dateFormat.date(from: timeStr)
        }
        return nil
    }
    public func transformToJSON(_ value: Date?) -> Double? {
        if let date = value {
            return Double(date.timeIntervalSince1970)
        }
        return nil
    }
}*/
