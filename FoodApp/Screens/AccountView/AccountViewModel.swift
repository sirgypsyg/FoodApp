//
//  AccountViewModel.swift
//  FoodApp
//
//  Created by Kuba on 01/02/2024.
//

import Foundation
import Firebase
import SwiftUI

final class AccountViewModel: ObservableObject  {
    
    @Published var email: String    = ""
    @Published var password: String = ""
    @Published var fullName: String    = ""
    
}
