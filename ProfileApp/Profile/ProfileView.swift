//
//  ProfileView.swift
//  ProfileApp
//
//  Created by Roman Zhukov on 16.04.2022.
//

import SwiftUI

struct ProfileView: View {
    @State private var bioText = ""
    
    var body: some View {
        VStack(spacing: 0) {
            PhotoView(image: "manRound", cornerRaius: 0, title: "Profile picture")
            Divider()
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 11, trailing: 0))
            PhotoView(image: "car-header", cornerRaius: 15, title: "Cover photo")
            Divider()
                .padding(EdgeInsets(top: 8, leading: 0, bottom: 11, trailing: 0))
            BioTFView(title: "Bio", bioText: $bioText)
            Spacer()
        }
        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
