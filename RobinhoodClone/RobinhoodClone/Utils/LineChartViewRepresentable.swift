//
//  LineChartViewRepresentable.swift
//  RobinhoodClone
//
//  Created by Alok Gupta on 03/05/25.
//


import SwiftUI
import DGCharts

struct LineChartViewRepresentable: UIViewRepresentable {
    var dataPoints: [Double]

    func makeUIView(context: Context) -> LineChartView {
        let chartView = LineChartView()
        chartView.legend.enabled = false
        chartView.rightAxis.enabled = false
        chartView.leftAxis.enabled = false
        chartView.xAxis.enabled = false
        chartView.isUserInteractionEnabled = false
        chartView.setScaleEnabled(false)
        chartView.backgroundColor = .clear
        return chartView
    }

    func updateUIView(_ uiView: LineChartView, context: Context) {
        let entries = dataPoints.enumerated().map { index, value in
            ChartDataEntry(x: Double(index), y: value)
        }

        let dataSet = LineChartDataSet(entries: entries, label: "")
        dataSet.drawCirclesEnabled = false
        dataSet.mode = .cubicBezier
        dataSet.lineWidth = 2
        dataSet.setColor(.systemGreen)
        dataSet.drawValuesEnabled = false

        let data = LineChartData(dataSet: dataSet)
        uiView.data = data
    }
}
