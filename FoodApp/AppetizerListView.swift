//
//  AppetizerListView.swift
//  FoodApp
//
//  Created by Kuba on 04/01/2024.
//

import SwiftUI

struct AppetizerListView: View {
    var body: some View {
        NavigationView{
                List(MockData.appetizers){ appetizer in
                    AppetizerTitleView(appetizer: appetizer)
                }
            .navigationTitle("🍎 appetizers")
        }
    }
}

#Preview {
    AppetizerListView()
}
