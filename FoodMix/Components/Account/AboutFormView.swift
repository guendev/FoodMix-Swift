//
//  AboutFormView.swift
//  FoodMix
//
//  Created by Yuan on 12/03/2022.
//

import SwiftUI

struct AboutFormView: View {
    
    @EnvironmentObject var viewModel: AccountViewModel
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            PrimaryInputLabel(label: "Giới Thiệu")
    
            TextEditor(text: $viewModel.about)
                .introspectTextView { textView in
                    textView.backgroundColor = UIColor(Color("InputBackground"))
                    textView.layer.cornerRadius = 15
                    textView.textContainerInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
                    textView.textColor = UIColor(Color("InputText"))
                }
                .accentColor(Color("InputText"))
                .lineSpacing(8)
                .overlay(
                    Text("Giới thiệu của bạn")
                        .foregroundColor(Color("InputText"))
                        .opacity($viewModel.about.wrappedValue.isEmpty ? 1 : 0)
                        .animation(.default)
                        .offset(x: 20, y: 20)
                    
                    ,alignment: .topLeading
                )
            
        }
        
    }
}
