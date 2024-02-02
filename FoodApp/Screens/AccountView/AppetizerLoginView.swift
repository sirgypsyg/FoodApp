//
//  AppetizerLoggedOfView.swift
//  FoodApp
//
//  Created by Kuba on 04/01/2024.
//

import SwiftUI
import Firebase

struct AppetizerLoginView: View {
    
    @State private var email       = ""
    @State private var password    = ""
    
    
    var body: some View {
        
        NavigationView {
            Form {
                // form field
                Section(header: Text("Personal Info")) {
                    InputView(text: $email, 
                              title: "Email Adress",
                              placeholder: "name@example.com")
                        .keyboardType(.emailAddress)
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .autocorrectionDisabled(true)
                    
                    InputView(text: $password, 
                              title: password,
                              placeholder: "Enter your password",
                              isSecureField: true)
                    //
                    Button{
                        print("temp")
                    }label: {
                        Text("Log in")
                    }
                }
            }
            .navigationTitle("Account view")
            NavigationLink{
                
            } label:{
                HStack{
                    Text("dont have an account?")
                    Text("Sign up")
                        .fontWeight(.bold)
                }
                .font(.system(size: 14))
            }
        }
    }
}
    #Preview {
        AppetizerLoginView()
    }

