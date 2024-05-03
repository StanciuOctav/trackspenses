//
//  Item.swift
//  TrackSpenses
//
//  Created by Octav Stanciu on 03.05.2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
