//
//  InfoFormView.swift
//  FoodMix
//
//  Created by Yuan on 10/03/2022.
//

import SwiftUI

struct InfoFormView: View {
    
    @EnvironmentObject var viewModel: AccountViewModel
    
    @State var name: String = ""
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            
            VStack(alignment: .leading) {
                
                PrimaryInputLabel(label: "Ảnh Đại Diện")
                
                HStack(spacing: 20) {
                    
                    Circle()
                        .fill(Color("Primary").opacity(0.1))
                        .frame(width: 65, height: 65)
                    
                    Button {
                        
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
                    
                    Button {
                        
                    } label: {
                        
                        Text("Xoá")
                            .font(.caption)
                            .foregroundColor(.red)
                        
                    }
                    
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
            
            VStack(alignment: .leading) {
                
                PrimaryInputLabel(label: "Ảnh Bìa")
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color("Primary").opacity(0.1))
                    .frame(height: 180)
                
                HStack(spacing: 20) {
                    
                    Button {
                        
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
                    
                    Button {
                        
                    } label: {
                        
                        Text("Xoá")
                            .font(.caption)
                            .foregroundColor(.red)
                        
                    }

                    
                }
                .padding(.top)
                
            }
            
            Divider()
                .padding(.vertical)
            
            TextField("Tên Người Dùng", text: $name)
                .primaryButton(label: "Tên Người Dùng")
            
            VStack(alignment: .leading) {
                
                TextField("user@foodmix.xyz", text: $name)
                    .primaryButton(label: "Email ID")
                    .disabled(true)
                
                PrimaryInputLabel(label: "Bạn không thể thay đổi Email của mình")
                    .opacity(0.5)
                
            }
            
            ProvinceFormView(provinces: viewModel.provincesMap)
            
            TextField("user@foodmix.xyz", text: $name)
                .frame(height: 50)
                .primaryButton(label: "Giới Thiệu")
            
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
            
        }
        
    }
}

struct InfoFormView_Previews: PreviewProvider {
    static var previews: some View {
        
        PreviewWrapper {
            
            AccountView()
            
        }
        
    }
}
