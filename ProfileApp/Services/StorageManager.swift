//
//  StorageManager.swift
//  ProfileApp
//
//  Created by Roman Zhukov on 18.04.2022.
//

import Foundation

class StorageManager {
    static let shared = StorageManager()
    
    private init() {}
    
    func savePersonData(person: Person) {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(person), forKey: "person")
    }
    
    func fetchPersonData() -> Person {
        guard let data = UserDefaults.standard.object(forKey: "person") as? Data else { return Person(bio: "")}
        guard let person = try? PropertyListDecoder().decode(Person.self, from: data) else { return Person(bio: "")}
        return person
    }
}
