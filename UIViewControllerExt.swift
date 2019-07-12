//
//  UIViewControllerExt.swift
//  Care
//
//  Created by Samuel Lagunes on 2/27/19.
//  Copyright © 2019 Kevin Barney. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    // Mark: - Alert
    
    @objc func showAlert(message:String?) {
        let alert = UIAlertController(title: .none, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: NSLocalizedString("OK", comment:"OK action"),
                                                              style: .default,
                                                              handler: .none)
        alert.addAction(okAction)
        present(alert, animated: true, completion: .none);
    }
    
    @objc func showAlert(title:String?, message:String?, andActions actions:[UIAlertAction]?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if let actions = actions {
            actions.forEach { (action) in
                alert.addAction(action)
            }
        } else {
            let okAction = UIAlertAction(title: NSLocalizedString("OK", comment:"OK action"),
                                         style: .default,
                                         handler: .none)
            alert.addAction(okAction)
        }

        if let popoverController = alert.popoverPresentationController {
            popoverController.sourceView = view
            popoverController.sourceRect = CGRect(x: view.bounds.midX, y: view.bounds.midY, width: 0, height: 0)
            popoverController.permittedArrowDirections = []
        }

        
        present(alert, animated: true, completion: .none)
    }
    
    
    @objc func showActionSheet(title:String?, message:String?, andActions actions:[UIAlertAction], andAnchorView anchorView:UIView?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        actions.forEach { (action) in
            alert.addAction(action)
        }
        
        if let popoverController = alert.popoverPresentationController,
            let anchorView = anchorView {
            popoverController.sourceView = anchorView
            popoverController.sourceRect = CGRect(x: anchorView.bounds.maxX, y: anchorView.bounds.midY, width: 0, height: 0)
            //popoverController.permittedArrowDirections = []
        }
        
        
        present(alert, animated: true, completion: .none)
    }
    
}
