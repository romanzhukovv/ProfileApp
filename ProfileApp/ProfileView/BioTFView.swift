//
//  BioTFView.swift
//  ProfileApp
//
//  Created by Roman Zhukov on 17.04.2022.
//

import SwiftUI

struct BioTFView: View {
    let viewTitle: String
    @Binding var bioText: String
    let buttonTitle: String
    let buttonAction: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(viewTitle).font(Font.system(size: 20, weight: .bold))
                Spacer()
                Button(action: buttonAction) {
                    Text(buttonTitle)
                        .font(Font.system(size: 16, weight: .regular))
                }
            }
            TextField("Describe yourself...", text: $bioText)
                .frame(height: 30, alignment: .center)
                .multilineTextAlignment(.center)
        }
    }
}

struct BioTFView_Previews: PreviewProvider {
    static var previews: some View {
        BioTFView(viewTitle: "Bio", bioText: .constant(""), buttonTitle: "Edit", buttonAction: {})
    }
}
