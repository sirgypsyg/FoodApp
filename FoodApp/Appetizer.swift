//
//  Appetizer.swift
//  FoodApp
//
//  Created by Kuba on 04/01/2024.
//

import Foundation

struct Appetizer: Decodable, Identifiable{
    
    var id: Int
    let price: Double
    let name: String
    let calories: Int
    let carbs: Int
    let urlString: String
    let description: String
}

struct AppetizerRequest{
    let request: [Appetizer]
}

struct MockData {
    
    static let sampleAppetizer = Appetizer(id: 1,
                                           price: 8.99,
                                           name: "Kebab",
                                           calories: 300,
                                           carbs: 14,
                                           urlString: "kebab",
                                           description: "This perfectly thin cut just melts in your mouth.")
    
    static let appetizers = [sampleAppetizer,sampleAppetizer,sampleAppetizer,sampleAppetizer,sampleAppetizer,sampleAppetizer,sampleAppetizer,sampleAppetizer,sampleAppetizer,sampleAppetizer,sampleAppetizer,sampleAppetizer]
}
