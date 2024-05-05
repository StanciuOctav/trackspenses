//
//  ContentView.swift
//  TrackSpenses
//
//  Created by Octav Stanciu on 03.05.2024.
//

import SwiftUI

struct RootView: View {
    
    @State private var gearTabEffect: Bool = false
    
    var body: some View {
        TabView {
            NavigationStack {
                CurrentMonthExpensesView()
                    .tabItem {
                        Label("Current month", systemImage: "doc.text")
                    }
            }
            
            NavigationStack {
                AddExpenseView()
                    .navigationTitle("New Acquisition")
                    .navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                Label("Add acquisition", systemImage: "plus.circle")
            }
            
            HistoryView()
                .tabItem {
                    Label("History", systemImage: "book")
                }
        }
    }
}

#Preview {
    RootView()
}
