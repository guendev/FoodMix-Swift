//
//  ActivityBigTop.swift
//  FoodMix
//
//  Created by Yuan on 27/02/2022.
//

import SwiftUI

struct ActivityBigTop: View {
    var body: some View {
        HStack(spacing: 0) {
            
            BigRankItem(
                user: User(id: "1", name: "Trọng Sơn", slug: "", avatar: "https://user-pic.webnovel.com/userheadimg/4310665642-10/100.jpg"),
                lines: [15, 16, 17, 18, 17, 16, 15],
                height: 160,
                colors: [Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)), Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)), Color(#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1))],
                rank: 2,
                rankColor: Color("Dodger Blue")
            )
            .offset(x: 15, y: 0)
            .zIndex(1)
            
            BigRankItem(
                user: User(id: "1", name: "Nguyên Trần", slug: "", avatar: "https://user-pic.webnovel.com/userheadimg/4307667847-10/200.jpg"),
                lines: [15, 16, 17, 18, 17, 16, 15],
                height: 160,
                colors: [Color(#colorLiteral(red: 0.6431372549, green: 0.4117647059, blue: 0.7882352941, alpha: 1)), Color(#colorLiteral(red: 0.8901960784, green: 0.5490196078, blue: 0.8274509804, alpha: 1)), Color(#colorLiteral(red: 0.9647058824, green: 0.7764705882, blue: 0.7960784314, alpha: 1))],
                rank: 1,
                rankColor: Color("Flickr Pink")
            )
            .offset(x: 0, y: -50)
            .overlay(
                
                ZStack {
                    
                    Image("crown")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .rotationEffect(Angle.init(degrees: 30))
                        .offset(x: 30, y: 0)
                    
                    Image("star")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 18)
                        .offset(x: -30, y: -13)
                    
                    Image("star")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 14, height: 14)
                        .offset(x: -50, y: 20)
                    
                    Image("star")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 14, height: 14)
                        .offset(x: 45, y: 65)
                    
                }
                .offset(x: 0, y: -80)
                
                ,alignment: .top
            
            )
            .zIndex(0)
            
            
            
            BigRankItem(
                user: User(id: "1", name: "Hoàng", slug: "", avatar: "https://user-pic.webnovel.com/userheadimg/4310570647-10/100.jpg"),
                lines: [15, 16, 17, 18, 17, 16, 15],
                height: 160,
                colors: [Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)), Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)), Color(#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1))],
                rank: 3,
                rankColor: Color("Purple 2")
            )
            .offset(x: -15, y: 0)
            
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 100)
        .padding(.horizontal, 30)
        .overlay(
            
            Image("leaf1")
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .foregroundColor(Color(#colorLiteral(red: 0.8078431373, green: 0.5725490196, blue: 0.5450980392, alpha: 1)))
                .frame(width: 80)
                .rotationEffect(Angle.init(degrees: 35))
                .offset(x: -12, y: 10)
            
            ,alignment: .topLeading

        )
        
        .overlay(
            
            Image("leaf2")
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .foregroundColor(Color(#colorLiteral(red: 0.8078431373, green: 0.5725490196, blue: 0.5450980392, alpha: 1)))
                .frame(width: 80)
                .rotationEffect(Angle.init(degrees: -35))
                .offset(x: 5, y: -10)
            
            ,alignment: .topTrailing

        )
    }
}

struct ActivityBigTop_Previews: PreviewProvider {
    static var previews: some View {
        ActivityBigTop()
    }
}


fileprivate struct RankItemShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY - 25))
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.maxY - 25), control: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        
        return path
    }
    
}

fileprivate struct BigRankItem: View {
    
    var user: User
    
    var lines: [CGFloat]
    
    var height: CGFloat
    
    var colors: [Color]
    
    var rank: Int
    
    var rankColor: Color
    
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            RecipeAvatar(avatar: user.avatar)
                .scaledToFit()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .clipped()
                .overlay(
                    
                    Text("\(rank)")
                        .fontWeight(.bold)
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                        .frame(width: 28, height: 28)
                        .background(rankColor)
                        .clipShape(Circle())
                        .offset(x: -5, y: -5)
                        .shadow(color: .black.opacity(0.1), radius: 10, x: 0.0, y: 0.0)
                    
                    
                    ,alignment: .bottomLeading
                    
                )
            
            Text(user.name)
                .font(.system(size: 14))
                .fontWeight(.semibold)
                .foregroundColor(.black.opacity(0.8))
                .padding(.top, 10)
                .frame(maxWidth: 80)
                .lineLimit(2)

            
            HStack(alignment: .bottom, spacing: 1.5) {
                
                
                ForEach(lines, id: \.self) { line in
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom))
                        .frame(width: line, height: height)
                }
                
            }
            .clipShape(RankItemShape())
            .overlay(
                
                Ellipse()
                    .fill(Color.white)
                    .frame(height: 25)
                    .offset(x: 0, y: -25/2)
                
                ,alignment: .top
            )
            .padding(.top, 40)
        }
        
    }
    
}
