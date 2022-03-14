//
//  UserCenter.swift
//  FoodMix
//
//  Created by Yuan on 27/02/2022.
//

import SwiftUI

struct UserCenter: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
       
        Group {
            
            HStack(spacing: 16) {
                
                Circle()
                    .fill(Color("Primary").opacity(0.3))
                    .overlay(
                        Group {
                            
                            if viewModel.auth {
                                
                                RecipeAvatar(avatar: viewModel.user?.avatar)
                                    .id(viewModel.user?.avatar)
                                
                            } else {
                                
                                Image("avatar")
                                    .resizable()
                                
                            }
                            
                        }
                    )
                    .frame(width: 56, height: 56)
                    .clipShape(Circle())
                
                VStack(alignment:  .leading, spacing: 0) {
                    
                    Text(viewModel.user?.name ?? "--")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("TextTitle"))
                        .lineLimit(1)
                    
                    if viewModel.auth {
                        
                        Text("dnstylish@gmail.com")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                    }
                    
                }
                
                Spacer()
                
                if viewModel.auth {
                    
                    NavigationLink {
                        AccountView()
                    } label: {
                        Text("Sửa")
                            .font(.caption)
                            .foregroundColor(.white)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 5)
                            .background(Color("Warning"))
                            .cornerRadius(20)
                    }
                    .buttonStyle(PlainButtonStyle())

                    
                }
                
            }
            
        }
        
    }
}

struct UserCenter_Previews: PreviewProvider {
    static var previews: some View {
        
        PreviewWrapper {
            
            SettingView()
            
        }
        
    }
}
