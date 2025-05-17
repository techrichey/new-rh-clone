//
//  PortfolioSummaryCard.swift
//  RobinhoodClone
//
//  Created by Alok Gupta on 17/05/25.
//


import SwiftUI

struct PortfolioSummaryCard: View {
    let subtitle: String
    let balance: Double
    let changeAmount: Double
    let changePercent: Double
    let isPositive: Bool
    var currencyCode = "USD"
    var duration = "today"
 
    
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 4) {
                Text(subtitle)
                    .font(.system(size:13, weight: .bold))
                    .foregroundColor(Color.white.opacity(0.5))
                
                Text(balance.formatted(.currency(code: currencyCode)))
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                HStack(spacing: 4) {
                    HStack(spacing: 4) {
                        Image(isPositive ? "arrow_up" : "arrow_down")
                            .font(.caption)
                        Text(
                            changeAmount
                                .formatted(.currency(code: currencyCode))
                        )
                        .font(.caption).bold()
                        Text("(\(String(format: "%.2f", changePercent))%)")
                            .font(.caption)
                        
                    }
                    .foregroundColor(
                        isPositive ? Color.colorRobinGreen : Color.red
                    )
                    Text("\(duration)")
                        .font(.caption)
                        .foregroundColor(Color.white)
                }
                
            }
            Spacer()
        }
        
    }
}

#Preview {
    
    ZStack {
        
        BackgroundGradient()
        VStack{
            PortfolioSummaryCard(
                subtitle: "Stocks and crypto",
                balance: 255_444_888,
                changeAmount: 4_530_756,
                changePercent: 3.45,
                isPositive: true
            )
            Spacer()
        }
    }
    
}


