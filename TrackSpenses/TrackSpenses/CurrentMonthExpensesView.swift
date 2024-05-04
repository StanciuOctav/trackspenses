//
//  CurrentMonthExpensesView.swift
//  TrackSpenses
//
//  Created by Octav Stanciu on 03.05.2024.
//

import SwiftUI

/// This should display a chart with all the expense and the total inside of it (also this view should be reusable for the profil view to show for previous months
/// Underneath should be a list with all the expenses and date and when tapped, the user should be redirected to all the details of it
struct CurrentMonthExpensesView: View {
    
    @State private var gearTabEffect = false
    
    var body: some View {
        Label("Current month", systemImage: gearTabEffect ? "doc.text" : "doc.text.fill")
            .contentTransition(.symbolEffect(.replace.downUp.wholeSymbol))
            .onTapGesture {
                gearTabEffect.toggle()
            }
    }
}

#Preview {
    CurrentMonthExpensesView()
}
