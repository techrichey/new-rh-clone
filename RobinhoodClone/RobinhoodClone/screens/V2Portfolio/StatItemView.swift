//
//  StatItemView.swift
//  RobinhoodClone
//
//  Created by Alok Gupta on 17/05/25.
//

import SwiftUI

import SwiftUI

// 1. A simple model for each stat cell
struct StatItem: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let value: Double
    let changePercent: Double?
    let changeAmount: Double?
    var isPositive: Bool
}

// 2. The cell view — no optional Binding, just a Bool + onTap callback

struct StatItemView: View {
    let item: StatItem
    let isSelected: Bool
    var selectionColor: Color = .colorRobinGreen
    let onTap: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            // Title with green status dot
            HStack(spacing: 4) {
                Text(item.title)
                    .font(.caption)
                    .foregroundColor(Color.white)
                
                Circle()
                    .fill(isSelected ? selectionColor:Color(hex: "#AEBAC1"))
                    .frame(width: 6, height: 6)
                Spacer()
                
            }
            
            HStack(spacing: 4) {
                
                Text(item.value.formatted(.currency(code: "USD")))
                    .font(.caption2)
                    .foregroundColor(.white)
              
                Image(item.isPositive ? "arrow_up" : "arrow_down")
                    .font(.caption2)
                Text("\(item.changePercent ?? 0.0, specifier: "%.2f")%")
                    .font(.caption2)
                    .foregroundColor(item.isPositive ? .colorRobinGreen : Color.red)
            }
           
        }
        .padding(12)
        .background(
            isSelected
            // exact selection background 20%
            ? selectionColor.opacity(0.2)
            // non-selected clear
            : Color.clear
        )
        .onTapGesture(perform: onTap)
    }
}



// 3. A grid container that manages selection
struct StatsGridView: View {
    let items: [StatItem]
    @Binding var selectedItem: StatItem?
    
    private let columns = [ GridItem(.flexible()), GridItem(.flexible()) ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 12) {
            ForEach(items) { item in
                StatItemView(
                    item: item,
                    isSelected: item == selectedItem,
                    onTap: { selectedItem = item }
                ).cornerRadius(5)
            }
        }
    }
}

// 4. Example parent view
struct SampleDashboardView: View {
    @State private var selectedStat: StatItem?
    private let stats = [
        StatItem(
            title: "Stocks and crypto",
            value: 255_444_888,
            changePercent: 1.65, changeAmount: 42_14_840.65,
            isPositive: true
        ),
        StatItem(
            title: "NFTs",
            value: 57_999.42,
            changePercent: -1.2, changeAmount: 695.99,
            isPositive: false
        ),
        StatItem(
            title: "Dow 30",
            value: 57_999.42,
            changePercent: 11.65, changeAmount: 6756.93,
            isPositive: true
        ),
        StatItem(
            title: "Gold",
            value: 2_200,
            changePercent: 1.65, changeAmount: 256.55,
            isPositive: true
        )
    ]
    
    var body: some View {
        VStack {
            StatsGridView(items: stats, selectedItem: $selectedStat)
                .padding()
            
            if let sel = selectedStat {
                Text("You selected: \(sel.title)")
                    .foregroundColor(.white)
                    .padding(.top)
            } else {
                Text("Tap a stat to select it")
                    .foregroundColor(.gray)
                    .padding(.top)
            }
            
            Spacer()
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    SampleDashboardView()
}
