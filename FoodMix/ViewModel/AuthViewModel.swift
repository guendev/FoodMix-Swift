//
//  LoginViewModel.swift
//  FoodMix
//
//  Created by Yuan on 28/02/2022.
//

import SwiftUI
import SwiftValidators

class AuthViewModel: ObservableObject {
    
    @AppStorage("welcome") var welcome: Bool = true
    
    @Published var name: String = ""
    @Published var nameError: String = ""
    
    @Published var email: String = ""
    @Published var emailError: String = ""
    
    @Published var password: String = ""
    @Published var passwordError: String = ""
    
    @Published var showPass: Bool = false
    
    @Published var type: AuthPage = .SignUp
    
    @Published var loading: Bool = false
    
    
    func signin() -> Void {
        
        validateForm {
            
            self.loading = true
            
            Network.shared.apollo.perform(mutation: SigninMutation(input: SignInInput(email: self.email, password: self.password))) { [weak self] result in
                
                guard let self = self else {
                      return
                }
                
                switch result {
                
                case .success(let graphQLResult) :
                    
                    if let errors = graphQLResult.errors {
                        print("❌ DEBUG: \(errors)")
                        break
                    }

                    // lưu data
                    UserDefaults.standard.set(graphQLResult.data?.signin.token, forKey: "jsonwebtoken")
                    
                    Toastify.show("Đăng Nhập Thành Công", image: "bell")
                                        
                    self.welcome = false
                                    
                    break
                    
                case .failure(_): break
                    // Lỗi mạng
                }
                
                self.loading = false
                
            }
            
        }
        
    }
    
    func signup() -> Void {
        validateForm {
            self.loading = true
            Network.shared.apollo.perform(mutation: SignupMutation(input: SignUpInput(name: self.name, email: self.email, password: self.password))) { [weak self] result in
                
                guard let self = self else {
                      return
                }
                
                switch result {
                
                case .success(let graphQLResult) :
                    
                    if let errors = graphQLResult.errors {
                        
                        print("❌ DEBUG: \(String(describing: errors.first?.message))")
                        break
                    }

                    // lưu data
                    UserDefaults.standard.set(graphQLResult.data?.signup.token, forKey: "jsonwebtoken")
                    
                    Toastify.show("Đăng Ký Thành Công", image: "bell")
                    
                    self.welcome = false
                                    
                    break
                    
                case .failure(_): break
                    // Lỗi mạng
                }
                
                self.loading = false
                
            }
        }
    }
    
    func checkEmail() -> String {
        var error = ""
        if email == "" {
            error = "Email không được để trống"
        } else if !Validator.isEmail().apply(email) {
            error = "Email không hợp lệ"
        }
        return error
    }
    
    func checkPassword(new: Bool = false) -> String {
        var error = ""
        if password == "" {
            error = "Mật khẩu không được để trống"
        } else if password.count <= 6 {
            error = "Mật khẩu quá ngắn"
        }
        
        return error
    }
    
    func checkName() -> String {
        var error = ""
        if name == "" {
            error = "Tên không được để trống"
        } else if name.count > 20  {
            error = "Tên không quá 20 ký tự"
        }
        return error
    }
    
    func validateForm(completion: @escaping () -> Void) -> Void {
        
        withAnimation {
            emailError = checkEmail()
            passwordError = checkPassword(new: type == .SignUp)
        }
        
        if type == .SignIn {
            
            if emailError == "" && passwordError == "" {
                completion()
            }
            
        } else {
            
            nameError = checkName()
            
            if emailError == "" && passwordError == "" && nameError == "" {
                completion()
            }
            
        }
        
        
    }
    
}

enum AuthPage {
    case SignIn
    case SignUp
}
