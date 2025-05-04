//
//  PortfolioPageView.swift
//  RobinhoodClone
//
//  Created by Alok Gupta on 03/05/25.
//

import SwiftUI

struct PortfolioPageView: View {
    var body: some View {
        VStack(spacing: 0) {
            PortfolioTopbarView()
            ScrollView {
                VStack(spacing: 16) {
                    // Top bar
                    PortfolioHeaderView()
                    DocumentUploadView()
                    CashInfoView()
                    PredictionMarketsView()
                    DiscoverMoreView()
                    WatchlistView()
                    StockListView()
                }
            }
        }
        .background(Color.black)
    }
}
struct PortfolioTopbarView: View {
    var body: some View {
        HStack {
            Text("Investing")
                .font(.headline)
                .foregroundColor(.white)

            Image(systemName: "chevron.down")
                .foregroundColor(.white)
            
            Spacer()

            Button(action: {}) {
                Text("Earn $5")
                    .font(.footnote.bold())
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Color.yellow)
                    .cornerRadius(20)
                    .foregroundColor(.black)
            }

            Button(action: {}) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.white)
                    .padding(.leading, 12)
            }

            Button(action: {}) {
                ZStack(alignment: .topTrailing) {
                    Image(systemName: "bell")
                        .foregroundColor(.white)
                    Circle()
                        .fill(Color.orange)
                        .frame(width: 8, height: 8)
                        .offset(x: 5, y: -5)
                }
            }
        }
    }
}
 
struct PortfolioHeaderView: View {
    var body: some View {
        VStack(spacing: 16) {
            

            VStack(alignment: .leading, spacing: 4) {
                Text("$97.81")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)

                Text("▲ $215.21 All time")
                    .font(.footnote)
                    .foregroundColor(.green)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

//            Rectangle()
//                .fill(Color.green)
//                .frame(height: 120)
//                .cornerRadius(4)

            LineChartViewRepresentable(dataPoints:
                                        [
                                            215.21, 215.21, 215.21, 43.77, 41.34, 41.34, 41.34, 41.34, 41.34, 41.34,
                                            215.21, 215.21, 215.21, 215.21, 215.21, 215.21, 215.21, 215.21, 215.21, 215.21,
                                            215.21, 215.21, 215.21, 196.90, 45.38, 45.38, 45.38, 45.38, 45.38, 45.38,
                                            89.83, 92.57, 94.63, 94.63, 94.63, 94.63, 94.63, 94.63, 94.63, 94.63,
                                            215.21, 215.21, 215.21, 215.21, 215.21, 215.21, 215.21, 215.21, 215.21, 215.21,
                                            44.30, 9.45, 9.45, 9.45, 9.45, 9.45, 9.45, 53.04, 93.58, 93.58,
                                            93.58, 93.58, 93.58, 93.58, 93.58, 93.58, 93.58, 93.58, 93.58, 93.58,
                                            153.63, 153.63, 153.63, 153.63, 42.76, 42.76, 42.76, 42.76, 84.11, 84.11,
                                            84.11, 84.11, 84.11, 84.11, 83.69, 83.69, 83.69, 83.69, 83.69, 83.69,
                                            83.69, 83.69, 83.69, 83.69, 83.69, 83.69, 83.69, 83.69, 83.69, 215.21
                                        ])
            
            .frame(height: 120)
            .padding(.vertical, 8)
            
            // Time range buttons
            HStack(spacing: 12) {
                ForEach(["1W", "1M", "3M", "YTD", "1Y", "ALL"], id: \.self) { period in
                    Text(period)
                        .font(.caption)
                        .foregroundColor(period == "ALL" ? .black : .white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(period == "ALL" ? Color.green : Color.clear)
                        .cornerRadius(6)
                }

                Spacer()
                
                Image(systemName: "gearshape")
                    .foregroundColor(.white)
            }

            // Buying Power
            HStack {
                Text("Buying power")
                    .foregroundColor(.white)
                Spacer()
                Text("$97.81")
                    .foregroundColor(.white)
            }
            .padding(.top, 4)
        }
        .padding()
        .background(Color.black.edgesIgnoringSafeArea(.top))
    }
}


 
struct DocumentUploadView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 6) {
                Image(systemName: "wifi") // Placeholder for upload icon
                    .foregroundColor(.gray)
                Text("Upload Your Document")
                    .foregroundColor(.gray)
                    .font(.caption)
            }

            Text("Take a photo of your bank statement now to continue using Robinhood.")
                .foregroundColor(.white)
                .font(.footnote)
                .fixedSize(horizontal: false, vertical: true)

            Button(action: {
                // Trigger camera or navigation
            }) {
                Text("Take Photo Now")
                    .font(.subheadline.bold())
                    .underline(true,color: .green.opacity(0.5))
                    .foregroundColor(.green)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(16)
        .padding(.horizontal)
    }
}



struct CashInfoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Cash")
                .font(.title2.bold())
                .foregroundColor(.white)

            VStack(spacing: 12) {
                HStack {
                    Text("Cash balance")
                        .foregroundColor(.gray)
                    Spacer()
                    Text("$97.81")
                        .foregroundColor(.white)
                }

                Divider()
                    .background(Color.gray)

                HStack {
                    Text("Current interest rate")
                        .foregroundColor(.gray)
                    Spacer()
                    Text("0% APY")
                        .foregroundColor(.gray)
                }

                Text("Earn 4.5% APY")
                    .foregroundColor(.green)
                    .font(.subheadline.bold())
                    .underline(true,color: .green.opacity(0.5))
                    .frame(maxWidth: .infinity, alignment: .leading)
                  
                    
            }
            .padding()
            .background(Color(.systemGray6).opacity(0.1))
            .cornerRadius(12)
        }
        .padding()
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct PredictionMarketsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Prediction markets")
                    .foregroundColor(.white)
                    .font(.title2.bold())
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
                    .font(.subheadline)
            }

            VStack(spacing: 8) {
                PredictionItemView(title: "Fed decision in May")
                PredictionItemView(title: "Inflation in April")
            }
        }
        .padding()
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct PredictionItemView: View {
    let title: String

    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.gray.opacity(0.3))
                .frame(width: 40, height: 40)
                .overlay(
                    Image(systemName: "cube.box") // placeholder icon
                        .foregroundColor(.white)
                )

            Text(title)
                .foregroundColor(.white)
                .font(.subheadline)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color(.systemGray6).opacity(0.1))
        .cornerRadius(12)
    }
}
 

struct WatchlistView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Section Title
            Text("Lists")
                .foregroundColor(.white)
                .font(.title2.bold())
                .padding(.horizontal)

            // Create watchlist
            HStack(spacing: 12) {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 44, height: 44)
                    .overlay(
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                    )

                Text("Create watchlist or screener")
                    .foregroundColor(.white)
                    .font(.body)

                Spacer()
            }
            .padding(.horizontal)

            // Existing watchlist
            HStack(spacing: 12) {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 44, height: 44)
                    .overlay(
                        Image(systemName: "bolt.fill")
                            .foregroundColor(.yellow)
                    )

                VStack(alignment: .leading, spacing: 4) {
                    Text("My First List")
                        .foregroundColor(.white)
                        .font(.body)
                    Text("21 items")
                        .foregroundColor(.gray)
                        .font(.caption)
                }

                Spacer()
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding(.top, 20)
        .background(Color.black.ignoresSafeArea())
    }
}
 

struct StockListView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                ForEach(stockData) { stock in
                    HStack(spacing: 12) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(stock.symbol)
                                .foregroundColor(.white)
                                .font(.headline)
                            Text(stock.name)
                                .foregroundColor(.gray)
                                .font(.caption)
                                .lineLimit(1)
                        }

                        Spacer()

                        MiniGraphView(change: stock.change)
                            .frame(width: 60, height: 30)

                        Text(String(format: "%+.2f%%", stock.change))
                            .font(.caption)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 6)
                            .background(
                                RoundedRectangle(cornerRadius: 6)
                                    .strokeBorder(stock.change >= 0 ? Color.green : Color.orange, lineWidth: 1)
                                    .background((stock.change >= 0 ? Color.green : Color.orange).opacity(0.2).cornerRadius(6))
                            )
                            .foregroundColor(stock.change >= 0 ? .green : .orange)
                    }
                }
            }
            .padding()
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct MiniGraphView: View {
    let change: Double

    var body: some View {
        // Simulated mini-graph using lines based on value
        GeometryReader { geometry in
            Path { path in
                let width = geometry.size.width
                let height = geometry.size.height
                let steps = 6
                let points = (0..<steps).map { i in
                    CGPoint(x: CGFloat(i) / CGFloat(steps - 1) * width,
                            y: height - CGFloat.random(in: 0...(height)))
                }
                path.addLines(points)
            }
            .stroke(change >= 0 ? Color.green : Color.orange, lineWidth: 1)
        }
    }
}

// MARK: - Model
struct Stock: Identifiable {
    let id = UUID()
    let symbol: String
    let name: String
    let change: Double
}

// MARK: - Sample Data
let stockData = [
    Stock(symbol: "BAC", name: "Bank of America", change: 0.55),
    Stock(symbol: "SYF", name: "Synchrony Financial", change: 0.63),
    Stock(symbol: "LOGC", name: "ContextLogic", change: 0.28),
    Stock(symbol: "AAPL", name: "Apple", change: 0.22),
    Stock(symbol: "META", name: "Meta Platforms", change: 0.01),
    Stock(symbol: "BEP", name: "Brookfield Renewable", change: 0.04),
    Stock(symbol: "AAL", name: "American Airlines", change: 0.00),
    Stock(symbol: "PWRD", name: "TCW Transform", change: -0.07)
]

#Preview {
    PortfolioPageView()
}
