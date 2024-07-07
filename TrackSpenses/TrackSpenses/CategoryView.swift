//
//  CategoryView.swift
//  TrackSpenses
//
//  Created by Octav Stanciu on 05.05.2024.
//

import Foundation
import SwiftUI

struct CategoryView: View {
    
    /// let categoryExpense: AcqModel
    var acquisition: ExpenseModel
    
    var body: some View {
        Text("\(acquisition.category.rawValue) for \(acquisition.price)")
    }
}

//#Preview {
//    CategoryView()
//}
