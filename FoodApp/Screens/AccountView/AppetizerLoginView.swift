//
//  AppetizerLoginView.swift
//  FoodApp
//
//  Created by Kuba on 04/01/2024.
//

import SwiftUI
import Firebase

struct AppetizerLoginView: View {
    
    @StateObject var viewModel = AccountViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Personal Info")) {
                        TextField("Email", text: $viewModel.email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .autocorrectionDisabled(true)
                        TextField("Password", text: $viewModel.password)
                        
                        Button {
                            print("temo")
                        } label: {
                            Text("Sign in")
                        }
                        .foregroundStyle(.brandSample)
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
                    .foregroundColor(.brandSample)
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
