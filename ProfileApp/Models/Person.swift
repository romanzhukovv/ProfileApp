//
//  Person.swift
//  ProfileApp
//
//  Created by Roman Zhukov on 17.04.2022.
//

import Foundation

struct Person: Codable {
    var profilePicture: Data
    var coverPhoto: Data
    var bio: String
}
