//
//  AccountViewModel.swift
//  FoodApp
//
//  Created by Kuba on 01/02/2024.
//

import Foundation

final class AccountViewModel : ObservableObject{
    
                
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var birthday = Date()
    @Published var napkins = false
    @Published var help = false
    
    @Published var alertItem: AlertItem?

    var isValid: Bool{
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            alertItem = AlertContext.invalidform
            return false
        }
        return true
    }
    
    
    func saveChanges(){
        guard isValid else {return}
        
        print("Changes saved :)")
    }
}
