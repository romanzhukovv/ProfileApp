//
//  HomeView.swift
//  ProfileApp
//
//  Created by Roman Zhukov on 16.04.2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
//        VStack(spacing: 0) {
            
            ScrollView {
                ZStack {
                    Spacer()
                }
                
                Text("John Doe").font(Font.system(size: 22, weight: .bold))
                Text("This is Bio").font(Font.system(size: 16, weight: .regular))
                Divider()
                    .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                HStack(spacing: 0) {
                    Text("Posts")
                        .padding(.leading, 16)
                        .font(Font.system(size: 24, weight: .bold))
                    Spacer()
                }
                
                ForEach(1..<10, id: \.self) {_ in
                    PostView()          
                }
            }
            .clipped()
            
            
            
//        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
