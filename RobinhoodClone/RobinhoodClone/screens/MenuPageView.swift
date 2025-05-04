//
//  MenuView.swift
//  RobinhoodClone
//
//  Created by Alok Gupta on 03/05/25.
//


import SwiftUI

import SwiftUI

struct MenuPageView: View {
    @Environment(\.dismiss) var dismiss
//    @AppStorage("isLoggedIn") var isLoggedIn: Bool = true
    @StateObject private var session = SessionManager()
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Menu")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)

                Spacer()

                Circle()
                    .strokeBorder(Color.yellow, lineWidth: 2)
                    .frame(width: 36, height: 36)
                    .overlay(
                        Image(systemName: "person.fill")
                            .foregroundColor(.yellow)
                    )
            }
            .padding()

            Group {
                MenuItem(title: "Investing", subtitle: "Balances, recurring investments, DRIP, Stock Lending") {}
                MenuItem(title: "Crypto", subtitle: "Transfer limits") {}
                MenuItem(title: "Transfers", subtitle: "Deposits, withdrawals, account transfers") {}
                MenuItem(title: "Rewards", subtitle: "Invite friends, earn stocks, get rewards") {}
                MenuItem(title: "History", subtitle: "Activity across all accounts") {}
                MenuItem(title: "Reports and statements", subtitle: "Account activity reports, monthly statements") {}
                MenuItem(title: "Tax center", subtitle: "Tax documents, FAQs") {}
            }
            .padding(.horizontal)

            Spacer()

            Button(action: {
                // Logout action
                logout()
                
            }) {
                Text("Logout")
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.gray)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 28)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                    )
            }

            Spacer().frame(height: 20)
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("Menu") // <- Enables back button
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func logout() {
//           isLoggedIn = false
          session.logout()
          dismiss()
           
       }
}

struct MenuItem: View {
    let title: String
    let subtitle: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        Text(title)
                            .foregroundColor(.white)
                            .font(.body)
                        Text(subtitle)
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                Divider().background(Color.gray.opacity(0.3))
            }
            .padding(.vertical, 4)
        }
    }
}

#Preview {
    MenuPageView()
}
