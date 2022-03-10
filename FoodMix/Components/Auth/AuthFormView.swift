//
//  LoginFormView.swift
//  FoodMix
//
//  Created by Yuan on 28/02/2022.
//

import SwiftUI

struct AuthFormView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    @EnvironmentObject var app: AppViewModel
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
        
    var body: some View {
        
        VStack(spacing: 20) {
            
            if viewModel.type == .SignUp {
                
                TextField("Tên Người Dùng", text: $viewModel.name)
                    .keyboardType(.emailAddress)
                    .primaryButton()
                    .overlay(
                        
                        Image(systemName: "person")
                            .foregroundColor(Color("InputText"))
                            .padding()
                            .offset(x: 5)
                        
                        ,alignment: .leading
                        
                    )
                    .withErrorForm(msg: $viewModel.nameError)
                
            }
                        
            TextField("Email ID", text: $viewModel.email)
                .keyboardType(.emailAddress)
                .primaryButton()
                .overlay(
                    
                    Image(systemName: "envelope")
                        .foregroundColor(Color("InputText"))
                        .padding()
                        .offset(x: 5)
                    
                    ,alignment: .leading
                    
                )
                .withErrorForm(msg: $viewModel.emailError)
            
            
            PasswordField()
                .font(.custom(.customFont, size: 16))
                .primaryButton()
                .overlay(
                    
                    Image(systemName: "lock.fill")
                        .foregroundColor(Color("InputText"))
                        .padding()
                        .offset(x: 5)
                    
                    ,alignment: .leading
                    
                )
                .overlay(
                    
                    Button {
                        
                        withAnimation {
                            viewModel.showPass.toggle()
                        }
                        
                    } label: {
                        
                        Image(systemName: viewModel.showPass ? "eye.slash" : "eye")
                            .foregroundColor(Color("InputText"))
                            .padding()
                            .offset(x: -5)
                        
                    }
                    
                    ,alignment: .trailing
                    
                )
                .withErrorForm(msg: $viewModel.passwordError)
            
            HStack {
                
                Spacer()
                
                Button {
                    
                } label: {
                    
                    Text("Quên mật khẩu?")
                        .font(.subheadline)
                        .foregroundColor(Color("Persian Blue"))
                    
                }
                
            }
                        
            Button {

                if viewModel.type == .SignIn {
                    viewModel.signin {
                        // thành công
                        app.queryUser {
                            app.subNotifyAction()
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                } else {
                    viewModel.signup {
                        app.queryUser {
                            app.subNotifyAction()
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
                
            } label: {
                
                Text("\(viewModel.type == .SignIn ? "Đăng Nhập" : "Đăng Ký")".uppercased())
                    .fontWeight(.semibold)
                    .padding()
                    .withLoading(active: $viewModel.loading)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .background(Color("Persian Blue"))
                    .cornerRadius(15)
                
            }
            .disabled(viewModel.loading)
            
            
        }
        .frame(maxWidth: 400)
        
    }
    
    @ViewBuilder
    private func PasswordField() -> some View {
        if viewModel.showPass {
            
            TextField("********", text: $viewModel.password)
                        
            
        } else {
            
            SecureField("********", text: $viewModel.password) {
                
            }
            
        }
    }
    
    @ViewBuilder
    func ErrorMessage() -> some View {
        Text("Email không hợp lệ")
            .font(.subheadline)
            .foregroundColor(Color("Flickr Pink"))
    }
}

struct AuthFormView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            AuthView()
            
        }
    }
}
