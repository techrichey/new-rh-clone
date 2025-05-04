//
//  ProfileView.swift
//  RobinhoodClone
//
//  Created by Alok Gupta on 03/05/25.
//


import SwiftUI
// ProfileView.swift
import SwiftUI

struct ProfilePageView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                VStack{
                    // Top Bar
                    ProfileTopbarView()
                    ScrollView {
                        VStack(spacing: 24) {
                            ProfileHeaderView()
                            InvestmentSummaryView()
                            InvestmentBreakdownView()
                            DiscoverMoreView()
                            DisclosureView()
                        }
                        .padding(.bottom, 40)
                    }
                    InviteAndRewardsView()
                        .padding(20)
                }
                
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
        }
    }
}
 
struct ProfileTopbarView: View {
    var body: some View {
        HStack {
            NavigationLink(destination: MenuPageView()) {
                Image(systemName: "line.3.horizontal")
                    .font(.title2)
            }

            Spacer()

            HStack(spacing: 20) {
                Image(systemName: "magnifyingglass")
                    .font(.title2)

                ZStack(alignment: .topTrailing) {
                    Image(systemName: "bell")
                        .font(.title2)

                    Circle()
                        .fill(Color.red)
                        .frame(width: 8, height: 8)
                        .offset(x: 6, y: -6)
                }
            }
        }
        .foregroundColor(.blue)
        .padding(.horizontal)
    }
}


struct ProfileHeaderView: View {
    var body: some View {
        VStack(spacing: 20) {
           

            // Profile Image and Info
            VStack(spacing: 8) {
                ZStack(alignment: .bottomTrailing) {
                    AsyncImage(url: URL(string: "https://media.licdn.com/dms/image/v2/C5603AQERosu_r-nmgQ/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1657574003260?e=1751500800&v=beta&t=ShIPU-eQTzQyrvJPI5CgFPW6jCUh4_sK1tPVSAFHaUg")) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 74, height: 74)
                                .clipShape(Circle())
                        } else if phase.error != nil {
                            Circle()
                                .fill(Color.gray)
                                .overlay(Text("❌"))
                                .frame(width: 74, height: 74)
                        } else {
                            Circle()
                                .fill(Color.gray.opacity(0.3))
                                .overlay(ProgressView())
                                .frame(width: 74, height: 74)
                        }
                    }

                    Circle()
                        .fill(Color.black)
                        .frame(width: 24, height: 24)
                        .overlay(
                            Image(systemName: "pencil")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 12, height: 12)
                                .foregroundColor(.blue)
                        )
                        .offset(x: 4, y: 4)
                }

                Text("@abhinavj41663")
                    .foregroundColor(.white)
                    .font(.subheadline)

                Text("$97.81")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.white)

                Text("Total in Robinhood")
                    .font(.footnote)
                    .foregroundColor(.gray)

                Text("Add account")
                    .font(.subheadline)
                    .foregroundColor(.blue)
                    .underline()
            }
        }
        .padding(.top)
        .background(Color.black.edgesIgnoringSafeArea(.top))
    }
}
import SwiftUI

struct InvestmentSummaryView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Header
            HStack(spacing: 4) {
                Text("Individual investing")
                    .font(.title2.bold())
                    .foregroundColor(.white)

                Image(systemName: "info.circle")
                    .foregroundColor(.gray)
            }

            // Value rows
            VStack(spacing: 12) {
                InvestmentRow(label: "Total individual value", value: "$97.81", bold: true)
                InvestmentRow(label: "Individual holdings", value: "$0.00")
                InvestmentRow(label: "Individual cash", value: "$97.81")
                InvestmentRow(label: "Crypto holdings", value: "$0.00")
            }
        }
        .padding()
        .background(Color.black)
    }
}

struct InvestmentRow: View {
    let label: String
    let value: String
    var bold: Bool = false

    var body: some View {
        HStack {
            Text(label)
                .foregroundColor(.gray)
                .font(.subheadline)
            Spacer()
            Text(value)
                .foregroundColor(.white)
                .fontWeight(bold ? .bold : .regular)
        }
    }
}



struct InvestmentBreakdownView: View {
    @State private var selectedTab = "Stocks"
    private let tabs = ["Stocks", "ETFs", "Options", "Crypto"]
    private let sectors = ["Business", "Consumer Goods", "Energy & Water", "Finance", "Tech"]

    var body: some View {
        VStack(spacing: 24) {
            // Top Tabs
         
            HStack(spacing: 24) {
                ForEach(tabs, id: \.self) { tab in
                    Text(tab)
                        .foregroundColor(selectedTab == tab ? .blue : .white)
                        .fontWeight(selectedTab == tab ? .semibold : .regular)
                        .onTapGesture {
                            selectedTab = tab
                        }
                }
            }
            .font(.subheadline)
            .padding(.horizontal)

            // Bubble Chart
            VStack(spacing: 16) {
                HStack(spacing: 24) {
                    BubbleCircle(title: "Stocks", percent: 0, isSelected: selectedTab == "Stocks")
                    BubbleCircle(title: "ETFs", percent: 0, isSelected: selectedTab == "ETFs")
                }

                HStack(spacing: 24) {
                    BubbleCircle(title: "Crypto", percent: 0, isSelected: selectedTab == "Crypto")
                    BubbleCircle(title: "Options", percent: 0, isSelected: selectedTab == "Options")
                }
            }

            // Description Text
            VStack(alignment: .leading, spacing: 4) {
                Text("Stocks are pieces of a company that investors can own.")
                    .font(.caption)
                    .foregroundColor(.gray)
                Text("Learn More")
                    .font(.caption)
                    .foregroundColor(.blue)
                    .underline()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)

            // Sector Pills
            WrapHStack(data: sectors, spacing: 12) { sector in
                Text(sector)
                    .font(.caption2)
                    .foregroundColor(.white)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(Color(.darkGray))
                    .clipShape(Capsule())
            }
            .padding(.horizontal)
        }
        .padding(.vertical)
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

// MARK: - BubbleCircle
struct BubbleCircle: View {
    let title: String
    let percent: Int
    let isSelected: Bool

    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(isSelected ? Color.blue : Color.gray.opacity(0.3))
                    .frame(width: 80, height: 80)

                VStack {
                    Text("\(percent)%")
                        .foregroundColor(.white)
                        .font(.subheadline)
                    Text(title)
                        .foregroundColor(.white)
                        .font(.caption2)
                }
            }
        }
    }
}

// MARK: - WrapHStack for multi-line tag layout
 
struct WrapHStack<Data: RandomAccessCollection, Content: View>: View where Data.Element: Hashable {
    var data: Data
    var spacing: CGFloat = 8
    var alignment: HorizontalAlignment = .leading
    let content: (Data.Element) -> Content

    @State private var sizes: [AnyHashable: CGSize] = [:]
    @State private var totalHeight: CGFloat = .zero

    var body: some View {
        GeometryReader { geometry in
            generateWrappedContent(in: geometry.size.width)
                .background(GeometryReader { proxy in
                    Color.clear
                        .preference(key: HeightKey.self, value: proxy.size.height)
                })
        }
        .frame(height: totalHeight)
        .onPreferenceChange(HeightKey.self) {
            if totalHeight != $0 {
                totalHeight = $0
            }
        }
    }

    private func generateWrappedContent(in availableWidth: CGFloat) -> some View {
        var rows: [[Data.Element]] = [[]]
        var currentRowWidth: CGFloat = 0

        for item in data {
            let itemSize = sizes[item] ?? CGSize(width: 100, height: 32)
            if currentRowWidth + itemSize.width + spacing > availableWidth {
                rows.append([item])
                currentRowWidth = itemSize.width + spacing
            } else {
                rows[rows.count - 1].append(item)
                currentRowWidth += itemSize.width + spacing
            }
        }

        return VStack(alignment: alignment, spacing: spacing) {
            ForEach(rows, id: \.self) { row in
                HStack(spacing: spacing) {
                    ForEach(row, id: \.self) { item in
                        content(item)
                            .fixedSize()
                            .background(GeometryReader { proxy in
                                Color.clear
                                    .preference(key: SizePreferenceKey.self,
                                                value: [AnyHashable(item): proxy.size])
                            })
                    }
                }
            }
        }
        .onPreferenceChange(SizePreferenceKey.self) { sizes = $0 }
    }
}

// Track each item size
private struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: [AnyHashable: CGSize] = [:]
    static func reduce(value: inout [AnyHashable: CGSize], nextValue: () -> [AnyHashable: CGSize]) {
        value.merge(nextValue(), uniquingKeysWith: { $1 })
    }
}

// Track total height
private struct HeightKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}


 

struct InviteAndRewardsView: View {
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 4) {
                Text("2 invites")
                    .foregroundColor(.blue)
                    .font(.subheadline)
                    .bold()

                HStack(spacing: -9) {
                    Image(systemName: "face.smiling.fill")
                        .foregroundColor(.gray)
                    Image(systemName: "face.smiling.fill")
                        .foregroundColor(.gray)
                        
                }
            }

            Spacer()

            Button(action: {}) {
                Text("Earn rewards")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.black)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 10)
                    .background(Capsule().fill(Color.blue))
            }
        }
        .padding(.horizontal)
        .padding(.top, 12)
    }
}




struct DisclosureView: View {
    var body: some View {
        Text("""
        All investing involves risk, including the loss of principal. Brokerage Holdings include securities and related products offered by registered broker-dealer Robinhood Financial LLC, member SIPC. Crypto Holdings are offered by Robinhood Crypto, LLC, are not securities, and are not covered by SIPC. Robinhood Crypto holdings are not offered by Robinhood’s broker-dealer and are therefore not subject to the same regulatory protections as those offered by Robinhood Financial.
        """)
        .font(.caption2)
        .foregroundColor(.gray)
        .padding(.horizontal)
    }
}



struct CirclePercentage: View {
    let title: String
    let percent: Int

    var body: some View {
        VStack {
            Circle()
                .fill(Color.gray.opacity(0.2))
                .frame(width: 60, height: 60)
                .overlay(Text("\(percent)%").foregroundColor(.white))
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}


#Preview {
    ProfilePageView()
}
