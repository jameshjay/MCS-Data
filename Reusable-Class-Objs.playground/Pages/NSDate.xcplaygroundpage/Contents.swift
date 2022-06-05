//: Playground - noun: a place where people can play

import UIKit
import Foundation

//let calendar = NSCalendar.currentCalendar()
//let date = NSDate()
//let components = calendar.components([.Month, .Day, .Hour, .Minute], fromDate: date)
//
////components gives you parts of the NSDate.
//
//print(components.minute)

////========================

let calendar = NSCalendar.currentCalendar()
let date = NSDate()
let components = NSDateComponents()

// you're setting it here.
components.weekOfYear = 1
components.hour = 12

//  date by adding components toDate (today's date)
print("1 week and 12 hours from now: \(calendar.dateByAddingComponents(components, toDate: date, options: [])!)")

//================

