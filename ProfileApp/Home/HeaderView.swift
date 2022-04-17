//
//  HeaderView.swift
//  ProfileApp
//
//  Created by Roman Zhukov on 17.04.2022.
//

import SwiftUI

struct HeaderView: View {

    var body: some View {
        ZStack {
//            GeometryReader { proxy in
                Image("car-header")
                    .resizable()
                    .cornerRadius(15, corners: [.topLeft, .topRight])
                    .scaledToFit()
//                    .frame(width: proxy.size.width * 0.92)
//                    .frame(width: proxy.size.width, height: proxy.size.height)
//            }
            Image("manRound")
                .overlay(Circle().stroke(Color.white, lineWidth: 14))
                .offset(y: screenHeight * 0.24 / 2)
                
        }.padding(.bottom, screenHeight * 0.24 / 2)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
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
