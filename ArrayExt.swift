//
//  ArrayExt.swift
//  Care
//
//  Created by Samuel Lagunes on 1/22/19.
//  Copyright © 2019 Kevin Barney. All rights reserved.
//

import Foundation

extension Array {
    func toJSONString() -> String {
        if self.isEmpty {
            return "[ ]";
        } else {
            var jsonString = "";
            
            for i in 0 ..< self.count {
                if i == 0 {
                    jsonString += "[ ";
                }
                
                jsonString += "\(self[i])";
                
                if i + 1 != self.count {
                    jsonString += ", ";
                } else {
                    jsonString += " ]";
                }
            }
            
            return jsonString;
        }
    }
}

@objc extension NSArray {
    public func toJSONString() -> String {
        if self.count == 0 {
            return "[ ]";
        } else {
            var jsonString = "";

            for i in 0 ..< self.count {
                if i == 0 {
                    jsonString += "[ ";
                }

                jsonString += "\(self[i])";

                if i + 1 != self.count {
                    jsonString += ", ";
                } else {
                    jsonString += " ]";
                }
            }

            return jsonString;
        }
    }
}
