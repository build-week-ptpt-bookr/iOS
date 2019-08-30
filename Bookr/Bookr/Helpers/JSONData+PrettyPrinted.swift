//
//  JSONData+PrettyPrinted.swift
//  Bookr
//
//  Created by Joshua Kaunert on 8/29/19.
//  Copyright © 2019 Bookr Team. All rights reserved.
//

import Foundation

extension Data {
    var prettyPrintedJSONString: NSString? { /// NSString gives us a nice sanitized debugDescription
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
            let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
            let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }
        
        return prettyPrintedString
    }
}
