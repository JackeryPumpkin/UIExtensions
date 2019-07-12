//
//  StringExt.swift
//  Care
//
//  Created by Zachary Duncan on 3/22/19.
//  Copyright © 2019 Zachary Duncan. All rights reserved.
//

import Foundation


extension String {
    static func +=(left: inout String?, right: String) {
        guard let newLeft = left else { left = right; return }
        left = newLeft + right
    }
    
    static func +=(left: inout String, right: String?) {
        guard let newRight = right else { return }
        left = newRight + left
    }
    
    static func <<(left: inout String?, right: String) {
        guard let newLeft = left else { left = "•  " + right; return }
        left = newLeft + "\n" + "•  " + right
    }
}
