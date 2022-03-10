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
                                
                            } else {
                                
                                Image("avatar")
                                    .resizable()
                                
                            }
                            
                        }
                    )
                    .frame(width: 56, height: 56)
                
                VStack(alignment:  .leading, spacing: 8) {
                    
                    Text(viewModel.user?.name ?? "--")
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                        .foregroundColor(.black.opacity(0.7))
                        .lineLimit(1)
                    
                    if viewModel.auth {
                        
                        Text("dnstylish@gmail.com")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                    }
                    
                }
                
                Spacer()
                
                if viewModel.auth {
                    
                    Button {
                        
                    } label: {
                        
                        Text("Sửa")
                            .font(.custom(.customFont, size: 13))
                            .foregroundColor(.white)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 7)
                            .background(Color("Warning"))
                            .cornerRadius(20)
                        
                    }
                    
                }
                
            }
            
        }
        
    }
}

struct UserCenter_Previews: PreviewProvider {
    static var previews: some View {
        
        PreviewWrapper {
            
            UserCenter()
            
        }
        
    }
}
