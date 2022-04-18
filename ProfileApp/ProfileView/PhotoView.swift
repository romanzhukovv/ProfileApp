//
//  PhotoView.swift
//  ProfileApp
//
//  Created by Roman Zhukov on 17.04.2022.
//

import SwiftUI

struct PhotoView: View {
    let image: UIImage
    let cornerRaius: CGFloat
    let title: String
    let isCircle: Bool
    let buttonAction: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(title).font(Font.system(size: 20, weight: .bold))
                Spacer()
                Button("Edit", action: buttonAction).font(Font.system(size: 16, weight: .regular))
            }
            
            if isCircle {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .padding(.top, 12)
            } else {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(cornerRaius)
                    .clipShape(Rectangle())
                    .padding(.top, 12)
            }
        }
        .frame(height: 228)
    }
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView(image: UIImage(named: "car-header") ?? UIImage(), cornerRaius: 15, title: "Profile picture", isCircle: true, buttonAction: {})
    }
}
