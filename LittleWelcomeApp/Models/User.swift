//
//  User.swift
//  LittleWelcomeApp
//
//  Created by Anton Saltykov on 16.08.2022.
//

struct User {
    let username: String
    let password: String
    let profile: Profile
}

extension User {
    static func getUser() -> User {
        User(
            username: "u",
            password: "p",
            profile: Profile.getProfile()
        )
    }
}
