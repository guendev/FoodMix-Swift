//
//  InfoFormView.swift
//  FoodMix
//
//  Created by Yuan on 10/03/2022.
//

import SwiftUI
import PhotosUI

struct InfoFormView: View {
    
    @EnvironmentObject var viewModel: AccountViewModel
    
    @Environment(\.currentUserKey) private var currentUserData
    
    @State var name: String = ""
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            
            AvatarFormView()
            
            BannerFormView()
            
            Divider()
                .padding(.vertical)
            
            TextField("Tên Người Dùng", text: $viewModel.name)
                .primaryInput(label: "Tên Người Dùng")
            
            VStack(alignment: .leading) {
                
                TextField("user@foodmix.xyz", text: $viewModel.email)
                    .primaryInput(label: "Email ID")
                    .disabled(true)
                
                PrimaryInputLabel(label: "Bạn không thể thay đổi Email của mình")
                    .opacity(0.5)
                
            }
            
            Divider()
                .padding(.vertical)
            
            GenderFormView()
                .padding(.bottom, 5)
            
            ProvinceFormView(provinces: viewModel.provincesMap)
            
            AboutFormView()
            
            Group {
                
                Button {
                    
                } label: {
                    
                    Text("Cập Nhật")
                        .font(.subheadline)
                        .padding(.horizontal, 20)
                        .frame(height: 40)
                        .background(Color("Primary"))
                        .foregroundColor(.white)
                        .cornerRadius(20)
                    
                }
                
            }
            .withAlignment(alignment: .leading)
            .padding(.top)
            
        }
        .onAppear {
            
            viewModel.getProvinces()
            
            resetForm()
            
        }
        
    }
    
    func resetForm() -> Void {
        viewModel.name = currentUserData?.name ?? ""
        viewModel.avatar = currentUserData?.avatar ?? ""
        viewModel.email = currentUserData?.email ?? ""
        viewModel.gender = currentUserData?.gender ?? .Boy
        viewModel.province = currentUserData?.province ?? "Hà Nội"
        viewModel.about = currentUserData?.about ?? ""
    }
}

struct InfoFormView_Previews: PreviewProvider {
    static var previews: some View {
        
        PreviewWrapper {
            
            AccountView()
            
        }
        
    }
}
