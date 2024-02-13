//
//  AuthViewModel.swift
//  FoodApp
//
//  Created by Kuba on 03/02/2024.
//

import Foundation
import Firebase
import FirebaseFirestore


protocol AuthenticationFormProtocol{
    var formIsValid: Bool{get}
}

@MainActor
class AuthViewModel: ObservableObject{
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var alertItem: AlertItem?
    
    
    init(){
        self.userSession = Auth.auth().currentUser
        
        Task{
          await fetchUser()
        }
    }
    
    init(userSession: FirebaseAuth.User? = nil, currentUser: User? = nil) {
        self.userSession = userSession
        self.currentUser = currentUser
    }
    
    
    
    func signIn(withEmail email: String, password: String) async throws{
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
            alertItem = AlertContext.userSaveSuccess;
        }catch{
            print("TSETing ")
            alertItem = AlertContext.invalidData;
        }
    }
    
    
    func createUser(withEmail email: String, password: String, fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            
            let user = User(id: result.user.uid, fullName: fullname, email: email)
            
            // Directly use the encoded value without the unnecessary cast
            let encodedUser = try Firestore.Encoder().encode(user)
            
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
            alertItem = AlertContext.userSaveSuccess;
            
        } catch {
            alertItem = AlertContext.invalidData;
            print("Error:")
        }
    }



    func signOut(){
        do{
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
            alertItem = AlertContext.logOff;
        } catch{
            alertItem = AlertContext.userSaveFail;
        }
    }
    
    func deleteAccount(){
        print("TEST 4")
    }
    
    func fetchUser() async {
            guard let uid = Auth.auth().currentUser?.uid else { return }
            
            let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument()
            self.currentUser = try? snapshot?.data(as: User.self)
    }
}

extension AppetizerLoginView: AuthenticationFormProtocol{
    var formIsValid: Bool{
        return !data.email.isEmpty
        && data.email.contains("@")
        && !data.password.isEmpty
        && data.password.count > 5
    }
}

extension AppetizerRegistrationView: AuthenticationFormProtocol{
    var formIsValid: Bool{
        return !data.email.isEmpty
        && data.email.contains("@")
        && !data.password.isEmpty
        && data.password.count > 5
        && !data.fullName.isEmpty
    }
}

