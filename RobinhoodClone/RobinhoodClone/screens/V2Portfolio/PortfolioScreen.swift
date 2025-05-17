//
//  PortfolioScreen.swift
//  RobinhoodClone
//
//  Created by Alok Gupta on 17/05/25.
//
import SwiftUI
import Charts



// MARK: - Main Portfolio Screen
struct PortfolioScreen: View {
    @State private var selectedRange: TimeRange = .oneDay
    @State private var selectedStat: StatItem?
    
    private var purchasePowerAmount: Double = 310_222_333 ;
    private var samplePortfolioData: [Double] = [
        0.0,
        0.2,
        0.4,
        0.6,
        0.8,
        1.0,
        1.1,
        1.2,
        1.25,
        1.3
    ]
    private  var sampleBenchmarkData: [Double] = [
        0.0,
        -0.1,
        -0.2,
        -0.3,
        -0.35,
        -0.4,
        -0.45,
        -0.5,
        -0.55,
        -0.6
    ]


    private let statsAvailable = [
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
        
        ZStack {
            BackgroundGradient()
            VStack(spacing: 0) {
                TopBarView(
                    title: "Portfolio",
                    profileURL:URL(
                        string: "https://xsgames.co/randomusers/assets/avatars/male/27.jpg"
                    ),
                    onSearch: {
                    },
                    onProfileTap: {}
                ).padding(.horizontal)
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 24) {
                        PortfolioSummaryCard(
                            subtitle: selectedStat?.title ?? "--",
                            balance: selectedStat?.value ?? 0.0 ,
                            changeAmount: selectedStat?.changeAmount ?? 0.0,
                            changePercent: selectedStat?.changePercent ?? 0.0,
                            isPositive: selectedStat?.isPositive ?? false,
                            duration: selectedRange.displayLabel
                        ).padding(.horizontal)
                        
                        CustomLineChartView(
                            series: [
                                .init(
                                    data: samplePortfolioData,
                                    color: Color(hex: "#1DB954")
                                ),
                                .init(
                                    data: sampleBenchmarkData,
                                    color: Color(hex: "#555555")
                                )
                            ]
                        )
                        .frame(height: 244)
                        .padding(.horizontal)
                        
                        TimeRangePicker(selected: $selectedRange)
                            .padding(.horizontal)
                        
                        
                        StatsGridView(
                            items:statsAvailable,
                            selectedItem:$selectedStat
                        )
                        .padding(.horizontal, 16)
                        
                        
                        
                        PrimaryActionBar(actions: [
                            .init(label: "New portfolio +", action: {}),
                            .init(label: "Edit", action: {})
                        ])
                        .padding(.horizontal, 16)
                        
                        Divider()
                            .background(Color.gray)
                            .padding(.horizontal)
                        
                        
                        ListActionView(
                            onTap: {
                            },
                            label: "Purchase power:",
                            value:"\(purchasePowerAmount.formatted(.currency(code: "USD")))")
                        .padding(.horizontal, 16)
                        
                        Divider()
                            .background(Color.gray)
                            .padding(.horizontal)
                        
                    }
                    .padding(.vertical, 24)
                }
                .onAppear() {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        selectedStat = statsAvailable[0]
                    }
                }
                 
            }
        }
    }
    
    private var safeAreaTop: CGFloat {
        UIApplication.shared.windows.first?.safeAreaInsets.top ?? 20
    }
}
 
// MARK: - Preview
struct PortfolioScreen_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioScreen()
            .previewDevice("iPhone 14 Pro")
    }
}
