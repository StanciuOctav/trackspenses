//
//  AcqModel.swift
//  TrackSpenses
//
//  Created by Octav Stanciu on 04.05.2024.
//

import Foundation

enum ExpenseCategory: String, CaseIterable, Codable {
    case food, entertainment, rent, savings, installments, others
}

class ExpenseModel {
    
    var name: String = ""
    var date: Date = Date.now
    var price: Double = 0.0
    var category: ExpenseCategory = ExpenseCategory.others
    var notes: String = ""
    
    init(name: String = "",
         date: Date = .now,
         price: Double = 0.0,
         category: ExpenseCategory = .others,
         notes: String = "")
    {
        self.name = name
        self.date = date
        self.price = price
        self.category = category
        self.notes = notes
    }
    
    func resetProperties() {
        name = ""
        date = .now
        price = 0.0
        category = .food
        notes = ""
    }
}

extension ExpenseModel: Hashable {
    
    static func == (lhs: ExpenseModel, rhs: ExpenseModel) -> Bool {
        lhs.name == rhs.name && lhs.category == rhs.category
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(date)
    }
}
