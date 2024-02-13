//
//  OrderView.swift
//  FoodApp
//
//  Created by Kuba on 04/01/2024.
//

import SwiftUI

struct OrderView: View {
    
    @State private var orderItems = MockData.orderItems
    
    var body: some View {
        NavigationView{
            VStack {
                List{
                    ForEach(orderItems) { appetizer in
                        AppetizerListCell(appetizer: appetizer)
                    }
                    .onDelete(perform: deleteItems)
                }
                .listStyle(.plain)
                
                Button{
                    
                } label: {
                    AddToOrderButton(appetizer: MockData.samp1)
                }
                .padding(.bottom, 20)
            }
            .navigationTitle("🧾 Orders")
            
        }
        
    }
    
    func deleteItems(at Offsets: IndexSet){
        orderItems.remove(atOffsets: Offsets)
    }
    
}

#Preview {
    OrderView()
}
