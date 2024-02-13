//
//  AppetizerRegistrationView.swift
//  FoodApp
//
//  Created by Kuba on 02/02/2024.
//

import SwiftUI

struct AppetizerRegistrationView: View {
    @StateObject var data = AccountData()
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Personal Info")) {
                        TextField("Full Name", text: $data.fullName )
                        TextField("Email", text: $data.email)
                            .keyboardType(.emailAddress)
                            .autocorrectionDisabled(true)
                        TextField("Password", text: $data.password)
                        
                        Button {
                            Task {
                                do {
                                    try await viewModel.createUser(withEmail: data.email,
                                                                   password: data.password,
                                                                   fullname: data.fullName)
                                    // Handle successful sign-in if needed
                                } catch {
                                    // Handle the error here
                                    print("Error signing in: \(error.localizedDescription)")
                                }
                            }
                        } label: {
                            Text("Sign up")
                                .frame(maxWidth: .infinity, alignment: .center)
                        }
                        .foregroundStyle(.cyan)
                        .disabled(!formIsValid)
                        .opacity(formIsValid ? 5.5 : 1.0)
                    }
                }
                .navigationTitle("Register 👨‍💻")
                .alert(item: $viewModel.alertItem){ alertItem in
                            Alert(title: alertItem.title,
                                  message: alertItem.message,
                                  dismissButton: alertItem.dismissButton)
                        }
                
                
                
                NavigationLink(destination: AppetizerLoginView().navigationBarBackButtonHidden()) {
                    HStack {
                        Text("Already have an account?")
                        Text("Log in")
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
    AppetizerRegistrationView()
}
