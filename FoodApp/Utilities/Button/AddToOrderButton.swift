//
//  AddToOrderButton.swift
//  FoodApp
//
//  Created by Kuba on 09/01/2024.
//

import SwiftUI

struct AddToOrderButton: View {
    
    let appetizer: Appetizer
    
    var body: some View {
        Button{
            
        }label: {
            Text("$\(appetizer.price, specifier: "%.2f") - Add To Order")
        }.frame(width: 400, height: 40)
            .buttonStyle(.borderedProminent)
            .font(.title3)
            .controlSize(.large)
            .tint(Color(.label))
            .buttonBorderShape(.roundedRectangle)
            .padding()
    }
}


#Preview {
    AddToOrderButton(appetizer: MockData.sampleAppetizer)
}
