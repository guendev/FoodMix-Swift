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
                    .autocapitalization(.none)
                    .font(.custom(.customFont, size: 16))
                    .foregroundColor(Color("InputText"))
                    .frame(height: 50)
                    .padding(.leading, 55)
                    .background(Color("InputBackground"))
                    .cornerRadius(15)
                    .overlay(
                        
                        Image(systemName: "person")
                            .foregroundColor(Color(#colorLiteral(red: 0.4352941176, green: 0.4352941176, blue: 0.4352941176, alpha: 1)))
                            .padding()
                            .offset(x: 5)
                        
                        ,alignment: .leading
                        
                    )
                    .withErrorForm(msg: $viewModel.nameError)
                
            }
                        
            TextField("Email ID", text: $viewModel.email)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .font(.custom(.customFont, size: 16))
                .foregroundColor(Color(#colorLiteral(red: 0.4352941176, green: 0.4352941176, blue: 0.4352941176, alpha: 1)))
                .frame(height: 50)
                .padding(.leading, 55)
                .background(Color(#colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 0.9391186773)))
                .cornerRadius(15)
                .overlay(
                    
                    Image(systemName: "envelope")
                        .foregroundColor(Color(#colorLiteral(red: 0.4352941176, green: 0.4352941176, blue: 0.4352941176, alpha: 1)))
                        .padding()
                        .offset(x: 5)
                    
                    ,alignment: .leading
                    
                )
                .withErrorForm(msg: $viewModel.emailError)
            
            
            PasswordField()
                .font(.custom(.customFont, size: 16))
                .foregroundColor(Color(#colorLiteral(red: 0.4352941176, green: 0.4352941176, blue: 0.4352941176, alpha: 1)))
                .frame(height: 50)
                .padding(.horizontal, 55)
                .background(Color(#colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 0.9391186773)))
                .cornerRadius(15)
                .overlay(
                    
                    Image(systemName: "lock.fill")
                        .foregroundColor(Color(#colorLiteral(red: 0.4352941176, green: 0.4352941176, blue: 0.4352941176, alpha: 1)))
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
                            .foregroundColor(Color(#colorLiteral(red: 0.4352941176, green: 0.4352941176, blue: 0.4352941176, alpha: 1)))
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
                .autocapitalization(.none)
                        
            
        } else {
            
            SecureField("********", text: $viewModel.password) {
                
            }
            .autocapitalization(.none)
            
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
