//
//  LoginView.swift
//  FoodMix
//
//  Created by Yuan on 27/02/2022.
//

import SwiftUI

struct AuthView: View {
    
    @StateObject var viewModel: AuthViewModel = AuthViewModel()
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var animation: Bool = false
    
    var body: some View {
        VStack {
            
            HStack {
                
                Button {
                    
                    presentationMode.wrappedValue.dismiss()
                    
                } label: {
                    
                    Image(systemName: "arrow.left")
                    
                }
                
                Spacer()
            }
            .padding(.vertical)
            
            ScrollView(.vertical, showsIndicators: false) {
                
                
                Image("login1")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect( animation ? 1 : 0.8)
                    .frame(width: getScreenBounds().width - 100)
                    .padding(.top, 50)
                
                
                Text("\(viewModel.type == .SignIn ? "Đăng Nhập" : "Đăng Ký")")
                    .font(.system(size: 30))
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 40)
                    .padding(.bottom, 25)
                
                // input group
                AuthFormView()
                
                HStack {
                    
                    Rectangle().fill(Color(#colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 0.9391186773))).frame(height: 1)
                    
                    Text("TIẾP TỤC VỚI")
                        .foregroundColor(Color(#colorLiteral(red: 0.4352941176, green: 0.4352941176, blue: 0.4352941176, alpha: 1)))
                    
                    Rectangle().fill(Color(#colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 0.9391186773))).frame(height: 1)
                    
                }
                .padding(.vertical, 25)
                
                Button {
                    
                } label: {
                    
                    HStack {
                        
                        
                        Image("google")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                        
                        Text("Tiếp Tục Bằng Google")
                            .font(.subheadline)
                            .foregroundColor(Color(#colorLiteral(red: 0.4352941176, green: 0.4352941176, blue: 0.4352941176, alpha: 1)))
                            .frame(maxWidth: .infinity)

                    }
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(Color(#colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 0.9391186773)))
                .cornerRadius(15)
                
                
                HStack {
                    
                    Text("\(viewModel.type == .SignIn ? "Chưa" : "Đã") có tài khoản?")
                        .foregroundColor(Color(#colorLiteral(red: 0.4352941176, green: 0.4352941176, blue: 0.4352941176, alpha: 1)))
                    
                    Button {
                        
                        withAnimation {
                            viewModel.type = viewModel.type == .SignIn ? .SignUp : .SignIn
                        }
                        
                    } label: {
                        
                        Text("Đăng \(viewModel.type == .SignIn ? "ký" : "nhập") ngay!")
                            .font(.subheadline)
                            .foregroundColor(Color("Persian Blue"))
                        
                    }
                    
                }
                .padding(.vertical, 25)
                
            }
        }
        .padding(.horizontal, 25)
        .environmentObject(viewModel)
        .onAppear {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation(.spring()) {
                    animation = true
                }
            }
            
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
