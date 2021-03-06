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
    @State private var imagePicker = false
    @State private var imageData: Data = Data()
    @State private var editProfilePicture = false
    
    var body: some View {
        VStack(spacing: 0) {
            PhotoView(image: (UIImage(data: viewModel.person.profilePicture ?? Data()) ?? UIImage(named:        "manRound")) ?? UIImage(),
                      cornerRaius: 15,
                      title: "Profile picture",
                      isCircle: true) {
                editProfilePicture.toggle()
                imagePicker.toggle()
            }
            Divider()
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 11, trailing: 0))
            PhotoView(image: (UIImage(data: viewModel.person.coverPhoto ?? Data()) ?? UIImage(named: "car-header")) ?? UIImage(),
                      cornerRaius: 15,
                      title: "Profile picture",
                      isCircle: false) {
                imagePicker.toggle()
            }
            Divider()
                .padding(EdgeInsets(top: 8, leading: 0, bottom: 11, trailing: 0))
            BioTFView(viewTitle: "Bio", bioText: $bioText) {
                viewModel.person.bio = bioText
                viewModel.savePerson()
            }
            Spacer()
        }
        .offset(y: -keyboardOffset)
        .animation(.easeInOut, value: keyboardOffset)
        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
        .onAppear {
            bioText = viewModel.person.bio
            
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { _ in
                keyboardOffset = 80
            }
            
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
                keyboardOffset = 0
            }
        }
        .fullScreenCover(isPresented: $imagePicker) {
            if imageData.count != 0 {
                if editProfilePicture {
                    viewModel.person.profilePicture = imageData
                    editProfilePicture.toggle()
                } else {
                    viewModel.person.coverPhoto = imageData
                }
                viewModel.savePerson()
            }
        } content: {
            ImagePicker(imagePicker: $imagePicker, imageData: $imageData)
        }

    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel())
    }
}
