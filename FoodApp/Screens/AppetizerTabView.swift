//
//  ContentView.swift
//  FoodApp
//
//  Created by Kuba on 04/01/2024.
//

import SwiftUI

struct AppetizerTabView: View {
    
    var body: some View {
        TabView{
            AppetizerListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            AppetizerLoginView()
                .tabItem {
                    Image(systemName: "person")
                    Text("person")
                }
            OrderView()
                .tabItem {
                    Image(systemName: "storefront")
                    Text("Order")
                }
        }.accentColor(Color(.brandSample))
    }
}

#Preview {
    AppetizerTabView()
}

