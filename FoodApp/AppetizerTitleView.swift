//
//  AppetizerTitleView.swift
//  FoodApp
//
//  Created by Kuba on 04/01/2024.
//

import SwiftUI

struct AppetizerTitleView: View {
    let appetizer: Appetizer
    
    var body: some View{
        AppetizerListCell(appetizer: appetizer)
    }
}


#Preview {
    AppetizerTitleView(appetizer: MockData.sampleAppetizer)
}
