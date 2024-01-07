//
//  LoadingView.swift
//  FoodApp
//
//  Created by Kuba on 06/01/2024.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable{
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = UIColor.red
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context){}
}



struct LoadingView: View {
    var body: some View {
        ZStack{
            Color(.label)
                .edgesIgnoringSafeArea(.all)
            ActivityIndicator()
        }
    }
}
