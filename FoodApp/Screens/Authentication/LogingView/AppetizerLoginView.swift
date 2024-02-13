//
//  AppetizerLoginView.swift
//  FoodApp
//
//  Created by Kuba on 04/01/2024.
//

import SwiftUI
import Firebase

struct AppetizerLoginView: View {

    @StateObject var data = AccountData()
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Personal Info")) {
                        TextField("Email", text: $data.email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .autocorrectionDisabled(true)
                        TextField("Password", text: $data.password)
                        
                        Button {
                            Task {
                                do {
                                    try await viewModel.signIn(withEmail: data.email, password: data.password)
                                    // Handle successful sign-in if needed
                                } catch {
                                    // Handle the error here
                                    print("Error signing in: \(error.localizedDescription)")
                                }
                            }
                        } label: {
                            Text("Sign in")
                                .frame(maxWidth: .infinity, alignment: .center)
                        }
                        .foregroundStyle(.cyan)
                        .disabled(!formIsValid)
                        .opacity(formIsValid ? 5.5 : 1.0)

                    }
                }
                .navigationTitle("Account view")
               
                
                Spacer() // Pushes the NavigationLink to the bottom
                
                NavigationLink(destination: AppetizerRegistrationView().navigationBarBackButtonHidden()) {
                    HStack {
                        Text("Don't have an account?")
                        Text("Sign up")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                    .foregroundColor(.cyan)
                }
                .padding()
                .padding()
                
            }
        }
    }
}

#Preview {
    AppetizerLoginView()
}
