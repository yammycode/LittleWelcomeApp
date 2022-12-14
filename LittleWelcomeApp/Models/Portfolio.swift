//
//  Portfolio.swift
//  LittleWelcomeApp
//
//  Created by Anton Saltykov on 16.08.2022.
//

struct Portfolio {
    let siteName: String
    let siteUrl: String
    let siteDescription: String
    let siteImage: String
}

extension Portfolio {
    static func getPortfolio() -> [Portfolio] {
        [
            Portfolio(
                siteName: "AutoExpert",
                siteUrl: "https://autoexpert.one/",
                siteDescription: "Автомобильный портал",
                siteImage: "autoexpert"
            ),
            Portfolio(
                siteName: "DataTest",
                siteUrl: "http://datatest.online/",
                siteDescription: "LandingPage",
                siteImage: "datatest"
            ),
            Portfolio(
                siteName: "DemarkHome",
                siteUrl: "http://demarkhome.com/",
                siteDescription: "Сайт-портфолио студии рисунка",
                siteImage: "demarkhome"
            ),
            Portfolio(
                siteName: "DennisDrums",
                siteUrl: "https://dennisdrums.com/",
                siteDescription: "Сайт студии ударных инструментов",
                siteImage: "dennisdrums"
            ),
            Portfolio(
                siteName: "Profy.RU",
                siteUrl: "https://profy.ru/",
                siteDescription: "WEB-приложение",
                siteImage: "profy"
            ),
            Portfolio(
                siteName: "GetBase",
                siteUrl: "https://getbase.pro/",
                siteDescription: "Корпоративный сайт",
                siteImage: "getbase"
            ),
            Portfolio(
                siteName: "OpenStage",
                siteUrl: "http://open-stage.ru/",
                siteDescription: "Сайт студии танцев",
                siteImage: "openstage"
            ),
        ]
    }
}
