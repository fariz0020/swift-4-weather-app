//
//  TimestampConverter.swift
//  weatherapp
//
//  Created by Wonderlabs on 5/17/18.
//  Copyright © 2018 blanja. All rights reserved.
//

import Foundation

class TimestampUtils {
    static func timestampToDate(timestamp: Double?) -> String? {
        if let unixTimestamp = timestamp {
            let date = Date(timeIntervalSince1970: unixTimestamp)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            dateFormatter.locale = Locale(identifier: "id_ID")
            print(dateFormatter.string(from: date))
            return dateFormatter.string(from: date)
        }
        return nil
    }
    
    static func timestampToTime(timestamp: Double?) -> String? {
        if let unixTimestamp = timestamp {
            let date = Date(timeIntervalSince1970: unixTimestamp)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .none
            dateFormatter.timeStyle = .medium
            dateFormatter.locale = Locale(identifier: "id_ID")
            print(dateFormatter.string(from: date))
            return dateFormatter.string(from: date)
        }
        return nil
    }
}

