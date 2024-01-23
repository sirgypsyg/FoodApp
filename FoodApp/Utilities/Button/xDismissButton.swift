//
//  DismissButton.swift
//  FoodApp
//
//  Created by Kuba on 09/01/2024.
//

//
//  xDismissButton.swift
//  Apple_Frameworks
//
//  Created by Kuba on 03/01/2024.
//

import SwiftUI

struct xDismissButton: View {
    @Binding var isShowingDetailView: Bool
    var body: some View {
        Button{
            isShowingDetailView = false
        }label:{
            ZStack{
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                    .opacity(0.6)
                    
                Image(systemName: "xmark")
                    .foregroundColor(.black)
                    .imageScale(.small)
                    .frame(width: 33, height: 33)
            }
        }
    }
}

#Preview {
    xDismissButton(isShowingDetailView: .constant(false))
}
