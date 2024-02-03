//
//  FoodAppApp.swift
//  FoodApp
//
//  Created by Kuba on 04/01/2024.
//

import SwiftUI
import Firebase

@main
struct FoodAppApp: App {
    @StateObject var viewModel = AuthViewModel()
 
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView()
                .environmentObject(viewModel)
        }
        
    }
}
