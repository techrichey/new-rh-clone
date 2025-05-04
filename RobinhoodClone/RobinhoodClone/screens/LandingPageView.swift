import SwiftUI

struct LandingPageView: View {
    @Environment(\.horizontalSizeClass) var hSizeClass
    @Environment(\.verticalSizeClass) var vSizeClass
    
    @State private var showLogin = false
    @State private var showSignUp = false
    @Binding  var isLoggedIn: Bool
    var body: some View {
        let isIpad = hSizeClass == .regular

        ZStack {
            Image("landing_illustration_2")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 15) {
                Spacer().frame(height: isIpad ? 100 : 0)

                Text("Welcome to Robinhood")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .padding(.horizontal, 100)

                Text(
                    "Join 23 million customers with access to US stocks and put your money in motion."
                )
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .padding(.horizontal, 32)

                Spacer()
                Spacer()

                HStack(spacing: 15) {
                    Button(action: {
                        showLogin = true
                    }) {
                        Text("Log in")
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                    }
                    .sheet(isPresented: $showLogin) {
                        LoginPageView(isLoggedIn: $isLoggedIn)
                    }

                    Button(action: {
                        showSignUp = true
                    }) {
                        Text("Sign up")
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(30)
                    }
                    .sheet(isPresented: $showSignUp) {
                        SignUpPageView()
                    }
                }
                .padding(.horizontal, 40)

                Spacer().frame(height: isIpad ? 100 : 0)
            }
            .padding(30)
        }
    }
}


#Preview {
    var binding = Binding<Bool>.constant(true)
    LandingPageView(isLoggedIn:  binding)
}
