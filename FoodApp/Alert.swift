//
//  Alert.swift
//  FoodApp
//
//  Created by Kuba on 05/01/2024.
//
import SwiftUI

struct AlertItem: Identifiable{
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext{
    static let invalidURL = AlertItem(title: Text("Server Error2"),
                                      message: Text("invalid URL"),
                                      dismissButton: .default(Text("OK")))
    
    static let invalidResponse = AlertItem(title: Text("Server Error"),
                                      message: Text("invalid response from the server"),
                                      dismissButton: .default(Text("OK")))
    
    
    static let invalidData = AlertItem(title: Text("Server Error"),
                                      message: Text("Received data was inavlid"),
                                      dismissButton: .default(Text("OK")))
    

    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                      message: Text("Check internet connection"),
                                      dismissButton: .default(Text("OK")))
}

