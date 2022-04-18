//
//  HeaderView.swift
//  ProfileApp
//
//  Created by Roman Zhukov on 17.04.2022.
//

import SwiftUI

struct HeaderView: View {
    let coverImage: UIImage
    let profileImage: UIImage
    
    var body: some View {
        ZStack {
            Image(uiImage: coverImage)
                .resizable()
                .scaledToFit()
                .cornerRadius(15, corners: [.topLeft, .topRight])
                .frame(width: screenWidth * 0.92, height: screenHeight * 0.24)

            Image(uiImage: profileImage)
                .resizable()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 14))
                .frame(width: screenWidth * 0.46, height: screenWidth * 0.46)
                .offset(y: screenHeight * 0.24 / 2)
                
        }.padding(.bottom, screenHeight * 0.24 / 2)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(coverImage: UIImage(named: "car-header") ?? UIImage(), profileImage: UIImage(named: "manRound") ?? UIImage())
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
