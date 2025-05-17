//
//  TimeRangePicker.swift
//  RobinhoodClone
//
//  Created by Alok Gupta on 17/05/25.
//


import SwiftUI

// MARK: - Time Range Enum
enum TimeRange: String, CaseIterable, Identifiable {
   
    case live = "live", oneDay = "1d", oneWeek = "1w", oneMonth = "1m"
    case threeMonth = "3m", oneYear = "1y", fiveYear = "5y", all = "all"
    
    var id: String { rawValue }

        /// A user-facing, descriptive label for each case
        var displayLabel: String {
            switch self {
            case .live:
                return "Live"
            case .oneDay:
                return "Today"
            case .oneWeek:
                return "1 Week"
            case .oneMonth:
                return "1 Month"
            case .threeMonth:
                return "3 Months"
            case .oneYear:
                return "1 Year"
            case .fiveYear:
                return "5 Years"
            case .all:
                return "All Time"
            }
        
    }
}


struct TimeRangePicker: View {
    @Binding var selected: TimeRange

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(TimeRange.allCases) { range in
                    Text(range.rawValue)
                        .font(.caption2).bold()
                        .foregroundColor(selected == range ? .black : .white)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 12)
                        .background(
                            selected == range ? Color.colorRobinGreen : Color.clear
                        )
                        .cornerRadius(5)
                        .onTapGesture { selected = range }
                }
            }
        }
    }
}


#Preview {
    
    ZStack {
        
        BackgroundGradient()
        VStack{
            Spacer()
            TimeRangePicker(selected: .constant(.oneWeek))
            Spacer()
        }
    }
   
}

  
