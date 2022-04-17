//
//  HomeView.swift
//  ProfileApp
//
//  Created by Roman Zhukov on 16.04.2022.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(spacing: 0) {
                    HeaderView()
                    Text("John Doe").font(Font.system(size: 22, weight: .bold))
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                    Text(viewModel.person.bio).font(Font.system(size: 16, weight: .regular))
                    Divider()
                        .padding(EdgeInsets(top: 25, leading: 15, bottom: 12, trailing: 15))
                    HStack(spacing: 0) {
                        Text("Posts")
                            .padding(.leading, 15)
                            .font(Font.system(size: 24, weight: .bold))
                        Spacer()
                    }
                    
                    ForEach(1..<10, id: \.self) {_ in
                        PostView()
                            .padding(EdgeInsets(top: 21, leading: 0, bottom: 40, trailing: 0))
                    }
                }
            }
            .clipped()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: ProfileViewModel())
    }
}
