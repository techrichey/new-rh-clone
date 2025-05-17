//
//  HomeView.swift
//  RobinhoodClone
//
//  Created by Alok Gupta on 03/05/25.
//


import SwiftUI

struct HomePageView: View {
    init() {
        UITabBar.appearance().barTintColor = UIColor.black
        UITabBar.appearance().backgroundColor = UIColor.black
        UITabBar.appearance().isTranslucent = false
    }
    var body: some View {
        TabView {
            PortfolioScreen()
                .tabItem {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                }

            Text("Settings")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black)
                .foregroundColor(.white)
                .tabItem {
                    Image(systemName: "gearshape")
             
                }

            Text("Notifications")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black)
                .foregroundColor(.white)
                .tabItem {
                    Image(systemName: "bell")
                }

            Text("Wallet")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black)
                .foregroundColor(.white)
                .tabItem {
                    Image(systemName: "creditcard")
                }

            ProfilePageView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                }
        }
        .accentColor(.white)
        .scrollContentBackground(.visible)
    }
}

#Preview {
    HomePageView()
}
