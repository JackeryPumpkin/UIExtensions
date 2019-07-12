//
//  UIImageExt.swift
//  Care
//
//  Created by Samuel Lagunes on 3/28/19.
//  Copyright © 2019 Zachary Duncan. All rights reserved.
//

import Foundation

extension UIImage {
    
    @objc static func image(fromBase64String base64String:String) -> UIImage? {
        if let imageData = Data(base64Encoded: base64String, options: .ignoreUnknownCharacters) {
            return UIImage(data: imageData)
        }
        
        return nil
    }
    

    @objc var base64String:String? {
        return self.pngData()?.base64EncodedString()
    }

    
}
