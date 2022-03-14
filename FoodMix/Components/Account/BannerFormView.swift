//
//  AccountFormView.swift
//  FoodMix
//
//  Created by Yuan on 13/03/2022.
//

import SwiftUI

struct BannerFormView: View {
    
    @EnvironmentObject var viewModel: AccountViewModel
    
    @State var openSheetBanner: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            
            PrimaryInputLabel(label: "Ảnh Bìa")
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("Primary").opacity(0.1))
                .frame(height: 180)
            
            HStack(spacing: 20) {
                
                Button {
                    
                    openSheetBanner = true
                    
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
                .sheet(isPresented: $openSheetBanner) {
                    
                    PhotoPicker(configuration: viewModel.pickPhotosConfig(), isPresented: $openSheetBanner) { results in
                        
                        viewModel.pickedAvatar(results, endpoint: "user-banner")
                        
                    }
                    
                }
                
                Button {
                    
                } label: {
                    
                    Text("Xoá")
                        .font(.caption)
                        .foregroundColor(.red)
                    
                }
                .disabled(viewModel.loadingBanner)

                
            }
            .padding(.top)
            
        }
    }
}
