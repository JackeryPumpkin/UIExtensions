//
//  DateExt.swift
//  chronosWS
//
//  Created by Samuel Lagunes on 10/17/17.
//  Copyright © 2017 Inflection Point SA de CV. All rights reserved.
//

import Foundation

@objc extension NSDate {
    
    @objc var localizedDescrition:String {
        let cast = self as Date
        return Date.formatter.string(from: cast)
    }
    
    @objc var startOfDay:Date {
        let cast = self as Date
        return Date.calendar.startOfDay(for: cast)
    }
    
    @objc var endOfDay:Date {
        let cast = self as Date
        return Date.calendar.date(byAdding: DateComponents(day:1, second:-1), to:cast.startOfDay)!
    }
    
    @objc func addDays(_ days:Int) -> Date {
        let cast = self as Date
        return Date.calendar.date(byAdding: .day, value: days, to: cast)!
    }
    
    @objc func addMonths(_ days:Int) -> Date {
        let cast = self as Date
        return Date.calendar.date(byAdding: .month, value: days, to: cast)!
    }
    
    @objc func addYears(_ days:Int) -> Date {
        let cast = self as Date
        return Date.calendar.date(byAdding: .year, value: days, to: cast)!
    }
    
    @objc func isBefore(_ date:Date) -> Bool {
        return compare(date) == .orderedAscending
    }
    
    @objc func isAfter(_ date:Date) -> Bool {
        return compare(date) == .orderedDescending
    }
    
    @objc func isBetween(_ startDate:Date, _ endDate:Date) -> Bool {
        if isBefore(startDate) {
            return false
        }
    
        if isAfter(endDate) {
            return false
        }
        
        return true
    }

    @objc func isSame(_ date:Date) -> Bool {
        return compare(date) == .orderedSame
    }
}


extension Date {
    
    fileprivate static let formatter:DateFormatter = {
        let formatter = DateFormatter()
        formatter.formatterBehavior = .default
        formatter.dateStyle = .short
        formatter.timeStyle = .long
        return formatter
    }()
    
    fileprivate static let calendar:Calendar = {
        return Calendar.current
    }()
    
    var localizedDescrition:String {
        return Date.formatter.string(from: self)
    }
    
    var startOfDay: Date {
        return Date.calendar.startOfDay(for: self)
    }
    
    var endOfDay:Date {
        return Date.calendar.date(byAdding: DateComponents(day:1, second:-1), to:startOfDay)!
    }
    
    var isWeekend:Bool {
        let weekday = Date.calendar.component(.weekday, from: self)
        
        if weekday == 1 || weekday == 7 {
            return true
        } else {
            return false
        }
    }
    
    var startOfWeek:Date {
        var components = Date.calendar.dateComponents([.year, .month, .weekday, .day], from: startOfDay)
        let offset = components.weekday! - Date.calendar.firstWeekday
        components.day = components.day! - offset
        
        return Date.calendar.date(from: components)!
    }
    
    var endOfWeek:Date {
        return Date.calendar.date(byAdding: DateComponents(second: -1, weekOfMonth: 1), to: startOfWeek)!
    }
    
    var startOfMonth:Date {
        let components = Date.calendar.dateComponents([.year, .month], from: startOfDay)
        return Date.calendar.date(from: components)!
    }
    
    var endOfMonth:Date {
        return Date.calendar.date(byAdding: DateComponents(month: 1 , second: -1), to: startOfMonth)!
    }
    
    var startOfYear:Date {
        let year = Date.calendar.component(.year, from: startOfDay)
        return Date.calendar.date(from: DateComponents(year: year))!
    }
    
    var endOfYear:Date {
        return Date.calendar.date(byAdding: DateComponents(year: 1, second: -1), to: startOfYear)!
    }
    
    func addDays(_ days:Int) -> Date {
        return Date.calendar.date(byAdding: .day, value: days, to: self)!
    }
    
    func addMonths(_ days:Int) -> Date {
        return Date.calendar.date(byAdding: .month, value: days, to: self)!
    }
    
    func addYears(_ days:Int) -> Date {
        return Date.calendar.date(byAdding: .year, value: days, to: self)!
    }
    
    func isBefore(_ date:Date) -> Bool {
        return compare(date) == .orderedAscending
    }
    
    func isAfter(_ date:Date) -> Bool {
        return compare(date) == .orderedDescending
    }
    
    func isBetween(_ startDate:Date, _ endDate:Date) -> Bool {
        if isBefore(startDate) {
            return false
        }
        
        if isAfter(endDate) {
            return false
        }
        
        return true
    }
    
    func isSame(_ date:Date) -> Bool {
        return compare(date) == .orderedSame
    }
}
