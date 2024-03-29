//
//  AppetizerListViewModel.swift
//  FoodApp
//
//  Created by Kuba on 05/01/2024.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetailView = false
    @Published var selectedAppetizer: Appetizer?
    
    func getAppetizers(){
        isLoading = true
        NetworkManager.shared.getAppetizers{ result in
            DispatchQueue.main.async{ [self] in
                isLoading = false
                switch result{
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error): // errors
                    switch error{
                    case .invalidURL:
                        alertItem =  AlertContext.invalidURL
                        
                    case .invalidResponse:
                        alertItem =  AlertContext.invalidResponse
                        
                    case .invalidData:
                        alertItem =  AlertContext.invalidData
                        
                    case .unableToComplete:
                        alertItem =  AlertContext.unableToComplete
                    }
                }
            }
        }
    }

    
}
