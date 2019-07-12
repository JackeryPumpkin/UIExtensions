//
//  UITableViewExt.swift
//  Care
//
//  Created by Zachary Duncan on 4/11/19.
//  Copyright © 2019 Zachary Duncan. All rights reserved.
//

import Foundation


extension UITableView {
    @objc func hasRow(at indexPath: IndexPath) -> Bool {
        if indexPath.section < numberOfSections {
            return indexPath.row < numberOfRows(inSection: indexPath.section)
        } else {
            return false
        }
    }
    
    @objc func availableIndexPathCountingDown(from indexPath: IndexPath?) -> IndexPath? {
        if let i = indexPath {
            if hasRow(at: i) {
                return i
            } else {
                if i.row == 0 && i.section == 0 {
                    return nil
                } else if i.row == 0 {
                    return availableIndexPathCountingDown(from: IndexPath(row: numberOfRows(inSection: i.section - 1) - 1, section: i.section - 1))
                } else {
                    return availableIndexPathCountingDown(from: IndexPath(row: i.row - 1, section: i.section))
                }
            }
        } else {
            return nil
        }
    }
}
