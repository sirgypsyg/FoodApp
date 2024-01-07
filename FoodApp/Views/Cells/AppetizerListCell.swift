//
//  AppetizerListCell.swift
//  FoodApp
//
//  Created by Kuba on 04/01/2024.
//

import SwiftUI
struct AppetizerListCell: View {
    
    let appetizer: Appetizer
    
    var body: some View {
        HStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90, alignment: .center)
                .cornerRadius(8)
                
            VStack(alignment: .leading, spacing: 5){
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("$\(appetizer.price, specifier: "%.2f")")             
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .tint(.gray)
            }.padding(.leading)
        }
    }
}

#Preview {
    AppetizerListCell(appetizer: MockData.sampleAppetizer)
}
