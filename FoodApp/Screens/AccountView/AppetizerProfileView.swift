//
//  AppetizerProfileView.swift
//  FoodApp
//
//  Created by Kuba on 02/02/2024.
//

import SwiftUI

struct AppetizerProfileView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if let user = viewModel.currentUser{
            List{
                Section{
                    HStack {
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(width: 72, height: 72)
                            .background(Color(.systemGray))
                        .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 4){
                            Text(user.fullName)
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                            
                            Text(user.email)
                                .font(.footnote)
                                .tint(Color(.systemGray))
                        }
                    }
                }
                
                
                Section("General"){
                    HStack{
                        SettingsRowView(imageName: "gear",
                                        title: "Version",
                                        tintColor:  Color(.systemGray))
                        Spacer()
                        
                        Text("1.0.0")
                            .font(.subheadline)
                            .foregroundStyle(Color(.systemGray))
                    }
                }
                
                Section("Account"){
                    Button{
                        viewModel.signOut()
                    } label: {
                        SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign out", tintColor: .red)
                    }
                    
                    Button{
                        viewModel.signOut()
                    } label: {
                        SettingsRowView(imageName: "arrow.left.circle.fill", title: "Delete Account", tintColor: .red)
                    }
                    
                }
            }
        }
    }
}

#Preview {
    AppetizerProfileView()
}
