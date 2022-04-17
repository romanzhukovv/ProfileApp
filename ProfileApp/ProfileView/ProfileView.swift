//
//  ProfileView.swift
//  ProfileApp
//
//  Created by Roman Zhukov on 16.04.2022.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel
    @State private var bioText = ""
    @State private var keyboardOffset: CGFloat = 0
    @State private var buttonTitleTF = "Edit"
    
    var body: some View {
        VStack(spacing: 0) {
            PhotoView(image: "manRound", cornerRaius: 0, title: "Profile picture")
            Divider()
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 11, trailing: 0))
            PhotoView(image: "car-header", cornerRaius: 15, title: "Cover photo")
            Divider()
                .padding(EdgeInsets(top: 8, leading: 0, bottom: 11, trailing: 0))
            BioTFView(viewTitle: "Bio", bioText: $bioText, buttonTitle: buttonTitleTF) {
            }
            Spacer()
        }
        .offset(y: -keyboardOffset)
        .animation(.easeInOut, value: keyboardOffset)
        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
        .onAppear {
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { _ in
                keyboardOffset = 80
            }
            
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
                keyboardOffset = 0
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel())
    }
}
