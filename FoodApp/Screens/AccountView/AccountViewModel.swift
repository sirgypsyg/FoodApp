//
//  AccountViewModel.swift
//  FoodApp
//
//  Created by Kuba on 01/02/2024.
//

import Foundation
import Firebase
import SwiftUI

final class AccountViewModel : ObservableObject{
    
                
    @Published var user = User()
    @Published var alertItem: AlertItem?
    @AppStorage("user") private var userData: Data?
    
    func retrieveUser(){
        guard let userData = userData else {return}
        
        do{
            user =  try JSONDecoder().decode(User.self, from: userData)
        } catch{
            alertItem = AlertContext.userSaveFail
        }
    }
    
    
    
    func saveChanges(){
        guard isValid else {return}
        
        do{
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSaveSuccess
        } catch{
            alertItem = AlertContext.userSaveFail
        }
       
    }
    
    var isValid: Bool{
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidform
            return false
        }
        return true
    }
    
    func login(){
     
        Auth.auth().createUser(withEmail: user.email, password: user.firstName) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
}
