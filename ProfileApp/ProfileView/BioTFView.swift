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
    @State private var buttonTitle = "Edit"
    @Binding var isEditable: Bool
    let buttonAction: () -> Void
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(viewTitle).font(Font.system(size: 20, weight: .bold))
                Spacer()
                Button {
                    isFocused = true
                    buttonAction()
                } label: {
                    Text(buttonTitle)
                        .font(Font.system(size: 16, weight: .regular))
                }
            }
            TextField("Describe yourself...", text: $bioText)
                .disabled(!isEditable)
                .focused($isFocused)
                .frame(height: 30, alignment: .center)
                .multilineTextAlignment(.center)
                .onChange(of: bioText) { _ in
                    buttonTitle = "Save"
                }
        }
    }
}

struct BioTFView_Previews: PreviewProvider {
    static var previews: some View {
        BioTFView(viewTitle: "Bio", bioText: .constant(""), isEditable: .constant(false), buttonAction: {})
    }
}
