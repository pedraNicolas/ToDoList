//
//  User.swift
//  HelloXcode
//
//  Created by Nicolas Pedra on 09/11/2023.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
