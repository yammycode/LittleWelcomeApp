//
//  Skill.swift
//  LittleWelcomeApp
//
//  Created by Anton Saltykov on 17.08.2022.
//

struct Skill {
    let title: String
    let percentLevel: Int
}

extension Skill {
    static func getSkills() -> [Skill] {
        [
            Skill(title: "HTML", percentLevel: 98),
            Skill(title: "CSS", percentLevel: 95),
            Skill(title: "JavaScript", percentLevel: 90),
            Skill(title: "TypeScript", percentLevel: 85),
            Skill(title: "PHP", percentLevel: 82),
            Skill(title: "MySQL", percentLevel: 80),
            Skill(title: "Golang", percentLevel: 60),
            Skill(title: "Swift", percentLevel: 1),
        ]
    }
}
