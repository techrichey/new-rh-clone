//
//  LoginView.swift
//  RobinhoodClone
//
//  Created by Alok Gupta on 03/05/25.
//

import SwiftUI
import SwiftUI
struct LoginPageView: View {
    @Binding var isLoggedIn: Bool
    @StateObject private var viewModel = LoginViewModel()
    @StateObject private var session = SessionManager()
    @State private var path = NavigationPath()
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color.black.ignoresSafeArea()

                VStack(spacing: 32) {
                    HStack {
                        Spacer()
                        Button(action: { dismiss() }) {
                            Image(systemName: "xmark")
                                .foregroundColor(.green)
                                .font(.title2)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 20)
                    }

                    Spacer()

                    Image(systemName: "leaf.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)

                    VStack(spacing: 20) {
                        TextField("Email", text: $viewModel.email)
                            .padding()
                            .keyboardType(.emailAddress)
                            .background(Color.clear)
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(
                                        Color.gray.opacity(0.6),
                                        lineWidth: 1
                                    )
                            )
                            .autocapitalization(.none)

                        HStack {
                            SecureField("Password", text: $viewModel.password)
                                .padding(.leading, 10)
                                .foregroundColor(.white)

                            Image(systemName: "person.fill.key")
                                .foregroundColor(.gray)
                                .padding(.trailing, 12)
                        }
                        .frame(height: 44)
                        .background(Color.clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                        )
                    }
                    .padding(.horizontal, 24)

                    VStack(spacing: 16) {
                        Button(action: {
                            viewModel.login { success in
                                if success, let loggedInUser = viewModel.user {
                                    session.user = loggedInUser
                                    isLoggedIn = true
                                    path.append("home")
                                }
                            }
                        }) {
                            Text("Log in")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(
                                    viewModel.formIsValid ? Color.green : Color.gray
                                        .opacity(0.2)
                                )
                                .foregroundColor(
                                    viewModel.formIsValid ? .white : .black
                                )
                                .cornerRadius(28)
                        }
                        .disabled(!viewModel.formIsValid)

                        Button(action: {
                            // Help action
                        }) {
                            Text("I need help")
                                .frame(maxWidth: .infinity)
                                .foregroundStyle(.gray)
                                .padding()
                        }
                        .background(Color.clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: 28)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )

                        if let error = viewModel.errorMessage {
                            Text(error)
                                .foregroundColor(.red)
                                .font(.caption)
                        }
                    }
                    .padding(.horizontal, 24)

                    Spacer()
                }
                .padding(.top, 40)
            }
            .navigationDestination(for: String.self) { value in
                if value == "home" {
                    HomePageView()
                }
            }
        }
    }
}


#Preview {
    var binding = Binding.constant(true)
    LoginPageView(isLoggedIn: binding)
}
