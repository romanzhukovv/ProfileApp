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
        person = fetchPerson()
    }
    
    func savePerson() {
        StorageManager.shared.savePersonData(person: person)
    }
    
    private func fetchPerson() -> Person {
        StorageManager.shared.fetchPersonData()
    }
}
