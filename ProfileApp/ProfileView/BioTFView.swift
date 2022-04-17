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
    @State private var isEditable = false
    let buttonAction: () -> Void
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(viewTitle).font(Font.system(size: 20, weight: .bold))
                Spacer()
                Button {
                    if bioText.isEmpty {
                        isEditable.toggle()
                    } else {
                        buttonAction()
                        hideKeyboard()
                        buttonTitle = "Edit"
                        isEditable.toggle()
                    }
                } label: {
                    Text(buttonTitle)
                        .font(Font.system(size: 16, weight: .regular))
                }
            }
            if isEditable {
                TextField("Describe yourself...", text: $bioText)
                    .focused($isFocused)
                    .frame(height: 30, alignment: .center)
                    .multilineTextAlignment(.center)
                    .onChange(of: bioText) { _ in
                        buttonTitle = "Save"
                    }
                    .onAppear {
                        DispatchQueue.main.async {
                            isFocused = true
                        }
                    }
            } else {
                TextField("Describe yourself...", text: $bioText)
                    .disabled(true)
                    .frame(height: 30, alignment: .center)
                    .multilineTextAlignment(.center)
            }
        }
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

//struct BioTFView_Previews: PreviewProvider {
//    static var previews: some View {
//        BioTFView(viewTitle: "Bio", bioText: .constant(""), isEditable: .constant(false), buttonAction: {})
//    }
//}
