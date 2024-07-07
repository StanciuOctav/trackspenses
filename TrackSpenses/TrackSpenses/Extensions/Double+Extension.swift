//
//  Double+Extension.swift
//  TrackSpenses
//
//  Created by Octav Stanciu on 07.07.2024.
//

import Foundation

extension Double {
    var twoDigitPrecision: String {
        self.formatted(.number.grouping(.automatic).precision(.fractionLength(2)))
    }
}
