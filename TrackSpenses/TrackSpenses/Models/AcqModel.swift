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

class AcqModel: Hashable {
    
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
    
    static func == (lhs: AcqModel, rhs: AcqModel) -> Bool {
        lhs.name == rhs.name && lhs.category == rhs.category
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(date)
        hasher.combine(price)
        hasher.combine(category)
        hasher.combine(notes)
    }
}
