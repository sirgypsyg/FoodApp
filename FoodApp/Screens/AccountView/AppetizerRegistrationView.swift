//
//  AppetizerRegistrationView.swift
//  FoodApp
//
//  Created by Kuba on 02/02/2024.
//

import SwiftUI

struct AppetizerRegistrationView: View {
    @StateObject var viewModel = AccountViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Personal Info")) {
                        TextField("Full Name", text: $viewModel.fullName )
                        TextField("Email", text: $viewModel.email)
                            .keyboardType(.emailAddress)
                            .autocorrectionDisabled(true)
                        TextField("Password", text: $viewModel.password)
                        
                        Button {
                            print("temo")
                        } label: {
                            Text("Sign up")
                        }
                        .foregroundStyle(.brandSample)
                    }
                }
                .navigationTitle("Register 👨‍💻")
                
                NavigationLink(destination: AppetizerRegistrationView().navigationBarBackButtonHidden()) {
                    HStack {
                        Text("Already have an account?")
                        Text("Log in")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                    .foregroundColor(.brandSample)
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
