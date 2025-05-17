//
//  CustomLineChartView.swift
//  RobinhoodClone
//
//  Created by Alok Gupta on 17/05/25.
//


import SwiftUI
import Charts

 struct CustomLineChartView: View {
    struct Series { let data: [Double]; let color: Color }
    let series: [Series]
    
    var body: some View {
        Chart {
            ForEach(series.indices, id: \.self) { idx in
                let s = series[idx]
                ForEach(Array(s.data.enumerated()), id: \.offset) { i, val in
                    LineMark(x: .value("Index", i), y: .value("Value", val))
                        .interpolationMethod(.catmullRom)
                        .foregroundStyle(s.color)
                        .lineStyle(StrokeStyle(lineWidth: 2, lineCap: .round))
                }
            }
        }
        .chartYAxis(.hidden)
        .chartXAxis(.hidden)
    }
}
#Preview(){
    // MARK: - Sample Data
    let samplePortfolioData: [Double] = [0.0, 0.2, 0.4, 0.6, 0.8, 1.0, 1.1, 1.2, 1.25, 1.3]
    let sampleBenchmarkData: [Double] = [0.0, -0.1, -0.2, -0.3, -0.35, -0.4, -0.45, -0.5, -0.55, -0.6]

    ZStack{
        BackgroundGradient()
        CustomLineChartView(
            series: [
                .init(data: samplePortfolioData, color: Color(hex: "#1DB954")),
                .init(data: sampleBenchmarkData, color: Color(hex: "#555555"))
            ]
        )
        .frame(height: 244)
        .padding(.horizontal)
    }
}
