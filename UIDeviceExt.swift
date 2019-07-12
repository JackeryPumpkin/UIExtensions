//
//  UIDeviceExt.swift
//  Care
//
//  Created by Samuel Lagunes on 3/11/19.
//  Copyright © 2019 Zachary Duncan. All rights reserved.
//

import Foundation

extension UIDevice {
    @objc static var isPad:Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    
    @objc static var isPhone:Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
}
