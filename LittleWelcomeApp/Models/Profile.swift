//
//  Profile.swift
//  LittleWelcomeApp
//
//  Created by Anton Saltykov on 16.08.2022.
//

struct Profile {
    let firstName: String
    let lastName: String
    let aboutText: String
    let age: Int
    let avatar: String
    let portfolio: [Portfolio]
}

extension Profile {
    static func getProfile() -> Profile {
        Profile(
            firstName: "Антон",
            lastName: "Салтыков",
            aboutText: "Full-stack WEB developer с большим желанием стать IOS разработчиком 😉",
            age: 37,
            avatar: "avatar",
            portfolio: Portfolio.getPortfolio()
        )
    }
}
