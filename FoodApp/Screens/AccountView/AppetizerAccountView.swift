//
//  AppetizerAccountView.swift
//  FoodApp
//
//  Created by Kuba on 04/01/2024.
//

import SwiftUI
import Firebase

struct AppetizerAccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("First Name", text: $viewModel.user.firstName)
                    TextField("Last Name", text: $viewModel.user.lastName)
                    TextField("Email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .autocorrectionDisabled(true)
                    DatePicker("Birthday", selection: $viewModel.user.birthday, displayedComponents: .date)
                    
                    Button{
                        viewModel.saveChanges()
                    }label: {
                        Text("Save Changes")
                    }
                    
                }
                
                Section(header: Text("Requests")){
                    Toggle("extra napkins", isOn: $viewModel.user.napkins)
                    Toggle("Additional help for disabled ", isOn: $viewModel.user.help)
                }
            }
            .navigationTitle("Account view")
        }
        .onAppear{
            viewModel.retrieveUser()
        }
        .alert(item: $viewModel.alertItem){ alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
            
        }
    }
}
    #Preview {
        AppetizerAccountView()
    }

