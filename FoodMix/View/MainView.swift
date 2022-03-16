//
//  MainView.swift
//  FoodMix
//
//  Created by Yuan on 24/02/2022.
//

import SwiftUI

struct MainView: View {
    
    @State var currentTab: MainTab = .Home
    
    @Namespace var animation
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            TabView(selection: $currentTab) {
                
                HomeView()
                    .tag(MainTab.Home)
                
                ActivityView()
                    .tag(MainTab.Activity)
                
                NotificationView()
                    .tag(MainTab.Notification)
                
                SettingView()
                    .tag(MainTab.Profile)
                
                
            }
            .overlay(
                
                HStack {
                    
                    ForEach(MainTab.allCases, id: \.self) { value in
                        
                        
                        Button {
                            
                            currentTab = value
                            
                        } label: {
                            
                            Image(value.rawValue)
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFit()
                                .foregroundColor( currentTab == value ? Color("Primary"): .gray)
                                .frame(width: 24)
                            
                        }
                        .frame(maxWidth: .infinity)
                        .overlay(
                        
                            Group {
                                
                                if currentTab == value {
                                    
                                    Circle()
                                        .fill(Color("Primary"))
                                        .frame(width: 6, height: 6)
                                        .offset(x: 0, y: 15)
                                        .matchedGeometryEffect(id: "MAINTAB", in: animation)
                                    
                                }
                                
                            }
                            
                            ,alignment: .bottom
                        )
                        
                    }
                    
                }
                .padding(.top)
                .padding(.bottom, safeInsets()?.bottom ?? 10)
                .background(Color("TabViewBackground"))
                .clipShape(MainTabShape())
                .shadow(color: .black.opacity(0.05), radius: 10, x: 0.0, y: 0.0)
                
                ,alignment: .bottom
                
            )
            
            
        }
        .ignoresSafeArea(.all, edges: .bottom)
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PreviewWrapper {
                MainView()
            }
            .environment(\.colorScheme, .dark)
        }
    }
}

struct MainTabShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let radius = rect.maxY / 2


        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        
        path.addLine(to: CGPoint(x: rect.minX + radius, y: rect.minY))
        
        path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.minY + radius), control: CGPoint(x: rect.minX, y: rect.minY))
            
        
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        
        
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - radius))
        
        path.addQuadCurve(to: CGPoint(x: rect.maxX - radius, y: rect.minY), control: CGPoint(x: rect.maxX, y: rect.minY))
        
        return path
    }
}


enum MainTab: String, CaseIterable {
    case Home = "Home"
    case Activity = "Activity"
    case Notification = "Notification"
    case Profile = "Profile"
}

