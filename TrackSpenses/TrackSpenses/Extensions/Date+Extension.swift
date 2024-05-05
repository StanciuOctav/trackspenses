//
//  Date+Extension.swift
//  TrackSpenses
//
//  Created by Octav Stanciu on 05.05.2024.
//

import Foundation

extension Date {
    var currentMonth: String {
        Date.now.formatted(.dateTime.month())
    }
}
