//
//  CalendarExt.swift
//  chronosWS
//
//  Created by Samuel Lagunes on 10/17/17.
//  Copyright © 2017 Inflection Point SA de CV. All rights reserved.
//

import Foundation

extension Calendar {
    
    fileprivate static let calendar:Calendar = {
        return Calendar.current
    }()
    
    static func daysBetweenDates(startDate: Date, endDate: Date) -> Int {
        return Calendar.calendar.dateComponents([.day], from: startDate, to: endDate).day ?? 0
    }
    
}
