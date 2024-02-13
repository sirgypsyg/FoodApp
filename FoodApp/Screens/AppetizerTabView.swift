//
//  ContentView.swift
//  FoodApp
//
//  Created by Kuba on 04/01/2024.
//

import SwiftUI

struct AppetizerTabView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel

    
    var body: some View {
        TabView{
            AppetizerListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            if viewModel.userSession != nil{
                AppetizerProfileView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("person")
                    }
            } else{
                AppetizerLoginView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("person")
                    }
            }
            
            OrderView()
                .tabItem {
                    Image(systemName: "storefront")
                    Text("Order")
                }
        }.accentColor(Color(.cyan))
    }
}

#Preview {
    AppetizerTabView()
}

