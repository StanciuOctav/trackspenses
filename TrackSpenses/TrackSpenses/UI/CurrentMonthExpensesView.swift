//
//  CurrentMonthExpensesView.swift
//  TrackSpenses
//
//  Created by Octav Stanciu on 03.05.2024.
//

import Charts
import SwiftUI

/// This should display a chart with all the expense and the total inside of it (also this view should be reusable for the profil view to show for previous months
/// Underneath should be a list with all the expenses and date and when tapped, the user should be redirected to all the details of it
/// An element could have been bought multiple times (eg. diesel for the car in 2 separate dates)
struct CurrentMonthExpensesView: View {
    
    /// This needs to be sorted
    var mockData = ExpenseMock.mockData
    
    @State private var chartData: [ExpenseModel] = []
    @State private var totalSpent: Double = 0.0
    @State private var selectedSector: Double?
    @State private var selectedTotalAcquisition: ExpenseModel?
    
    var body: some View {
        Form {
            Section {
                /// Make the chart interactive https://swdevnotes.com/swift/2023/create-a-pie-or-donut-chart-with-swiftui-charts-in-ios-17/
                Chart(chartData, id: \.category) { dataItem in
                    SectorMark(angle: .value("Price", dataItem.price),
                               innerRadius: .ratio(0.6),
                               outerRadius: selectedTotalAcquisition == dataItem ? 175 : 120,
                               angularInset: 2)
                    .cornerRadius(5)
                    .foregroundStyle(by: .value("Category", dataItem.category.rawValue.capitalized))
                }
                .scaledToFill()
                .chartAngleSelection(value: $selectedSector)
                .chartBackground { chartProxy in
                    GeometryReader { geometry in
                        let frame = geometry[chartProxy.plotFrame!]
                        VStack {
                            Text((selectedTotalAcquisition != nil ? selectedTotalAcquisition?.category.rawValue.capitalized : "Total") ?? "")
                                .font(.callout)
                                .foregroundStyle(.secondary)
                            Text((selectedTotalAcquisition != nil ? selectedTotalAcquisition?.price.twoDigitPrecision : totalSpent.twoDigitPrecision) ?? "")
                                .font(.title2.bold())
                                .foregroundColor(.primary)
                                .padding(.horizontal)
                        }
                        .position(x: frame.midX, y: frame.midY)
                    }
                }
            }
            
            Section {
                ForEach(mockData, id: \.self) { data in
                    NavigationLink(value: data) {
                        HStack {
                            Text(data.name)
                                .badge(data.price.twoDigitPrecision)
                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button("Delete", systemImage: "trash", role: .destructive) {
                                // TODO: Delete the item
                            }
                        }
                    }
                }
            }
        }
        .navigationDestination(for: ExpenseModel.self, destination: { value in
            CategoryView(acquisition: value)
        })
        .onChange(of: selectedSector, { oldValue, newValue in
            if let newValue {
                withAnimation {
                    selectedSector(value: newValue)
                }
            }
        })
        .onAppear {
            self.createChartData()
            self.calculateTotal()
        }
    }
    
    private func createChartData() {
        chartData = mockData
        // Group by category
            .reduce(into: [:]) { result, ExpenseModel in
                result[ExpenseModel.category, default: []].append(ExpenseModel)
            }
        // Calculate total price for each category
            .map { category, models in
                ExpenseModel(
                    name: models.first?.name ?? "ERROR",
                    date: Date(),
                    price: models.reduce(0.0) { $0 + $1.price },
                    category: category,
                    notes: ""
                )
            }
            .sorted(by: { $0.price < $1.price })
    }
    
    private func calculateTotal() {
        self.totalSpent = chartData.reduce(0.0) { $0 + $1.price }
    }
    
    private func selectedSector(value: Double) {
        var comulativeTotal = 0.0
        let _ = chartData
            .first { element in
                comulativeTotal += element.price
                if value <= comulativeTotal {
                    selectedTotalAcquisition = element
                    return true
                }
                return false
            }
    }
}

#Preview {
    NavigationStack {
        CurrentMonthExpensesView()
            .navigationTitle("\(Date().currentMonth.capitalized)")
            .navigationBarTitleDisplayMode(.automatic)
    }
}
