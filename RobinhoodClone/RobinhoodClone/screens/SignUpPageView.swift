//
//  SignUpView.swift
//  RobinhoodClone
//
//  Created by Alok Gupta on 03/05/25.
//

import SwiftUI
// SignUpView.swift
import SwiftUI

struct SignUpPageView: View {
    @State private var email: String = ""
    @Environment(\.dismiss) private var dismiss
    @State private var showAlert: Bool = false

    var body: some View {
 
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 24) {
                // Back Button
                HStack {
                    Button(action: {
                        // Handle back navigation
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .font(.title2)
                    }
                    Spacer()
                }
                .padding(.top, 10)
                .padding(.horizontal)

                Spacer()

                // Headline
                VStack(alignment: .leading, spacing: 8) {
                    Text("What’s your email address?")
                        .font(.title2.bold())
                        .foregroundColor(.white)

                    Text("You’ll use this email to log in next time.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)

                // Email Field
                TextField("Email address", text: $email)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                    )
                    .foregroundColor(.white)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .padding(.horizontal)

                // Policy Info Text
                VStack(alignment: .leading, spacing: 4) {
                    Text("By continuing, you agree to the ")
                        .foregroundColor(.gray)
                    + Text("Robinhood User Account Agreement").underline()
                        .foregroundColor(.white)
                    + Text(" and ").foregroundColor(.gray)
                    + Text("Privacy Policy").underline()
                        .foregroundColor(.white)

                    Text("This app is protected by reCAPTCHA and the ")
                        .foregroundColor(.gray)
                    + Text("Google Privacy Policy").underline()
                        .foregroundColor(.white)
                    + Text(" and ").foregroundColor(.gray)
                    + Text("Terms of Service").underline()
                        .foregroundColor(.white)
                }
                .font(.caption)
                .padding(.horizontal)

                // Continue Button
                Button(action: {
                    // Continue action
                    print("This action is not implemented yet.")
                    showAlert = true
                }) {
                    Text("Continue")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            isValidEmail(email) ? Color.white : Color.gray
                                .opacity(0.3)
                        )
                        .foregroundColor(.black)
                        .cornerRadius(12)
                }
                .padding(.horizontal)
                .disabled(!isValidEmail(email))
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Alert"),
                        message: Text("This action is not implemented yet."),
                        dismissButton: .default(Text("OK"))
                    )
                }

                Spacer()
            }
        }
        
        
    }

    func isValidEmail(_ email: String) -> Bool {
        return email.contains("@") && email.contains(".")
    }
}

#Preview {
    SignUpPageView()
}
