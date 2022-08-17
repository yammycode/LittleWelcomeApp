//
//  SkillsViewController.swift
//  LittleWelcomeApp
//
//  Created by Anton Saltykov on 17.08.2022.
//

import UIKit

final class SkillsViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet var skillsDescriptionLabel: UILabel!

    // MARK: - Public Properties
    var skills: [Skill] = []

    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        var skillText = ""
        for skill in skills {
            skillText += "\(skill.title): \(skill.percentLevel)%\n"
        }
        skillsDescriptionLabel.text = skillText + "\n\nЗ.Ы. Тот случай когда собирался сделать красивые прогресс-бары, стильную анимацию, оналйн чат с ботом, нейросетью и искусственным интеллектом... Но на ютубе не нашлось подходящего видосика... 🥺"
    }

    override func viewWillAppear(_ animated: Bool) {
        setGradientBackground()
        super.viewWillAppear(animated)
    }
}
