//
//  DiscoverMoreView.swift
//  RobinhoodClone
//
//  Created by Alok Gupta on 03/05/25.
//

import SwiftUI

struct DiscoverMoreView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Discover more")
                .font(.title2.bold())
                .foregroundColor(.white)
                .padding(.horizontal)

            VStack(spacing: 12) {
                DiscoverCardView(
                    title: "4.5% APY with Gold",
                    subtitle: "Boost your rate on uninvested cash",
                    trailingText: "4.5%",
                    trailingColor: .orange,
                    icon: "percent"
                )

                DiscoverCardView(
                    title: "Robinhood Strategies",
                    subtitle: "Get access to an expert-managed portfolio",
                    trailingText: "New",
                    trailingColor: .green,
                    icon: "cube.fill"
                )

                DiscoverCardView(
                    title: "Retirement",
                    subtitle: "Earn up to 2% on IRA transfers till April 30",
                    icon: "globe.americas.fill"
                )

                DiscoverCardView(
                    title: "Transfer accounts in",
                    subtitle: "Consolidate assets",
                    icon: "arrow.left.arrow.right"
                )
            }
        }
        .padding(.bottom)
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}
