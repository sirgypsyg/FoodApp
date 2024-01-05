//
//  APIError.swift
//  FoodApp
//
//  Created by Kuba on 05/01/2024.
//

import Foundation

enum APIError: Error{
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
