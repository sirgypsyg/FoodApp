//
//  AppetizerListView.swift
//  FoodApp
//
//  Created by Kuba on 04/01/2024.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject var viewModel = AppetizerListViewModel()
    
    //618
    var body: some View {
        NavigationView{
            List(viewModel.appetizers){ appetizer in
                    AppetizerListCell(appetizer: appetizer)
                }
            .navigationTitle("🍎 appetizers")
        }
        .onAppear{
            viewModel.getAppetizers()
        }
        .alert(item: $viewModel.alertItem){ alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
    
}

#Preview {
    AppetizerListView()
}
