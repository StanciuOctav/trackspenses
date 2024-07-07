//
//  AddExpenseView.swift
//  TrackSpenses
//
//  Created by Octav Stanciu on 03.05.2024.
//

import SwiftUI

/// This view should be able to make the addition of a new acquisition by date, price, category etc and confirm if it were added or not
struct AddExpenseView: View {
    
    @State private var model = ExpenseModel()
    
    var body: some View {
        Form {
            Section {
                HStack {
                    TextField("eg. iPhone 15 Pro", text: $model.name, axis: .vertical)
                        .multilineTextAlignment(.leading)
                        .tint(.primary)
                        .textFieldStyle(.plain)
                }
            }
            
            Section(header: Text("Date of purchase")) {
                DatePicker("The date of purchase", selection: $model.date, displayedComponents: .date)
                    .datePickerStyle(.graphical)
            }
            
            Section(header: Text("Others")) {
                HStack {
                    Text("Price")
                    Spacer()
                    TextField("Price", value: $model.price, format: .number)
                        .keyboardType(.decimalPad)
                        .multilineTextAlignment(.trailing)
                }
                
                Picker("Category", selection: $model.category) {
                    ForEach(ExpenseCategory.allCases, id: \.self) { category in
                        Text(category.rawValue.capitalized).tag(category)
                    }
                }
                .pickerStyle(.automatic)
            }
            
            VStack {
                TextField("Notes...", text: $model.notes, axis: .vertical)
                    .tint(.primary)
                    .multilineTextAlignment(.leading)
                    .ignoresSafeArea(.all, edges: .all)
                    .padding(.top)
                Spacer()
            }
            .frame(minHeight: 200)
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    // TODO: Save the object in DB
                } label: {
                    Text("Save")
                }
            }
            
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    model.resetProperties()
                } label: {
                    Text("Clear all")
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        AddExpenseView()
            .navigationTitle("New Acquisition")
            .navigationBarTitleDisplayMode(.inline)
    }
}
