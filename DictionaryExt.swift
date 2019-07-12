//
//  DictionaryExt.swift
//  Care
//
//  Created by Samuel Lagunes on 1/22/19.
//  Copyright © 2019 Kevin Barney. All rights reserved.
//

import Foundation

extension Dictionary {
    public func jsonString() -> String? {
        guard let jsonData = try? JSONSerialization.data(withJSONObject: self, options: [.prettyPrinted]) else {
            return nil;
        }
        
        return String(data: jsonData, encoding: .utf8);
    }
}

extension NSDictionary {
    @objc func jsonString() -> String? {
        guard let jsonData = try? JSONSerialization.data(withJSONObject: self, options: [.prettyPrinted]) else {
            return nil;
        }
        
        return String(data: jsonData, encoding: .utf8);
    }
}
