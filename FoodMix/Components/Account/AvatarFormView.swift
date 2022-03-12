//
//  AvatarFormView.swift
//  FoodMix
//
//  Created by Yuan on 13/03/2022.
//

import SwiftUI

struct AvatarFormView: View {
    
    @EnvironmentObject var viewModel: AccountViewModel
    
    @State var openSheetAvatar: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            
            PrimaryInputLabel(label: "Ảnh Đại Diện")
            
            HStack(spacing: 20) {
                
                RecipeAvatar(avatar: viewModel.avatar)
                    .scaledToFill()
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
                    .id(viewModel.avatar)
                
                Button {
                    
                    openSheetAvatar = true
                    
                } label: {
                    
                    Text("Chọn Ảnh")
                        .font(.caption)
                        .padding(.horizontal, 15)
                        .frame(height: 30)
                        .background(Color("Primary").opacity(0.1))
                        .foregroundColor(Color("Primary"))
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("Primary"), lineWidth: 1)
                        )
                    
                }
                .sheet(isPresented: $openSheetAvatar) {
                    
                    PhotoPicker(configuration: viewModel.pickPhotosConfig(), isPresented: $openSheetAvatar) { results in
                        
                        viewModel.pickedAvatar(results, endpoint: "user-avatar")
                        
                    }
                    
                }
                
                Button {
                    
                } label: {
                    
                    Text("Xoá")
                        .font(.caption)
                        .foregroundColor(.red)
                    
                }
                .disabled(viewModel.loadingAvatar)
                
                Spacer()
                
            }
            .padding(20)
            .padding(.horizontal, 5)
            .frame(maxWidth: .infinity)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color("InputBackground"), lineWidth: 2)
            )
            
        }
        .padding(.horizontal, 1)
    }
}

