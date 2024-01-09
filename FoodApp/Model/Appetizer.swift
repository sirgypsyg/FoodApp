//
//  Appetizer.swift
//  FoodApp
//
//  Created by Kuba on 04/01/2024.
//

import Foundation

struct Appetizer: Decodable, Identifiable{
    
    let id: Int
    let description: String
    let name: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse:Decodable{
    let request: [Appetizer]
}

struct MockData {
    
    static let sampleAppetizer = Appetizer(id: 11, description: "good food greetings", name: "pierogi", price: 12, imageURL: "asian-flank-steak-2", calories: 11, protein: 41, carbs: 14)
    
    static let appetizers = [sampleAppetizer,sampleAppetizer,sampleAppetizer,sampleAppetizer,sampleAppetizer,sampleAppetizer,sampleAppetizer,sampleAppetizer,sampleAppetizer,sampleAppetizer,sampleAppetizer,sampleAppetizer]
}
