//
//  ProfileViewModel.swift
//  ProfileApp
//
//  Created by Roman Zhukov on 17.04.2022.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var person: Person = Person(bio: "This is Bio")
}
