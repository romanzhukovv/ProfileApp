//
//  PostView.swift
//  ProfileApp
//
//  Created by Roman Zhukov on 16.04.2022.
//

import SwiftUI

struct PostView: View {
    let profileImage: UIImage
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Image(uiImage: profileImage)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                Text("John Doe")
                    .font(Font.system(size: 14, weight: .semibold))
                    .padding(EdgeInsets(top: -10, leading: 5, bottom: 0, trailing: 0))
                Spacer()
            }
            .padding(.leading, 18)
            Text("If you're looking for a cute dessert for a party or even just a little pick-me up, try making some of @bakedbyjosie's bite sized cheesecakes! For more delicious baked goods, watch Baked by Josie")
                .lineSpacing(12)
                .font(Font.system(size: 14, weight: .regular))
                .padding(EdgeInsets(top: 18, leading: 18, bottom: 25, trailing: 18))
            Image("man")
                .resizable()
//                .frame(width: screenWidth * 0.92, height: screenHeight * 0.24)
                .scaledToFit()
        }
        
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(profileImage: UIImage(named: "manRound") ?? UIImage())
    }
}
