//
//  AcqModel.swift
//  TrackSpenses
//
//  Created by Octav Stanciu on 04.05.2024.
//

import Foundation
import SwiftData

enum ExpenseCategory: String, CaseIterable, Codable {
    case food, entertainment, rent, savings, installments, others
}

@Model
class AcqModel {
    var name: String = ""
    var date: Date = Date.now
    var price: Double = 0.0
    var category: ExpenseCategory = ExpenseCategory.others
    var notes: String?
    
    init(name: String = "", date: Date, price: Double, category: ExpenseCategory = .others, notes: String?) {
        self.name = name
        self.date = date
        self.price = price
        self.category = category
        self.notes = notes
    }
}
