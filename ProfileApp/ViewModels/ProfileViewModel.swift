//
//  ProfileViewModel.swift
//  ProfileApp
//
//  Created by Roman Zhukov on 17.04.2022.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var person: Person = Person(profilePicture: Data(), coverPhoto: Data(), bio: "This is Bio")
    
    init() {
        person = StorageManager.shared.fetchPersonData()
        print(person)
    }
    
    func savePerson() {
        StorageManager.shared.savePersonData(person: person)
    }
}
