//
//  PostView.swift
//  ProfileApp
//
//  Created by Roman Zhukov on 16.04.2022.
//

import SwiftUI

struct PostView: View {
    var body: some View {
        VStack(spacing: 0) {
            Text("If you're looking for a cute dessert for a party or even just a little pick-me up, try making some of @bakedbyjosie's bite sized cheesecakes! For more delicious baked goods, watch Baked by Josie")
                .lineSpacing(12)
                .font(Font.system(size: 14, weight: .regular))
                .padding(EdgeInsets(top: 0, leading: 18, bottom: 30, trailing: 18))
            Image("man")
                .resizable()
        }
        
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
