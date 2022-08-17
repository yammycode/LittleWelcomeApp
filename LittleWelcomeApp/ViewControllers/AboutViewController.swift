//
//  AboutViewController.swift
//  LittleWelcomeApp
//
//  Created by Anton Saltykov on 16.08.2022.
//

import UIKit

final class AboutViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var aboutTextLabel: UILabel!
    @IBOutlet var avatarImageView: UIImageView!

    // MARK: - Public Properties
    var fullName = ""
    var age: Int!
    var aboutText = ""
    var avatar = ""

    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = fullName
        ageLabel.text = age.formatted() + " лет"
        aboutTextLabel.text = aboutText

        avatarImageView.image = UIImage(named: "avatar.png")
        avatarImageView.layer.borderWidth = 5
        avatarImageView.layer.masksToBounds = false
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.cornerRadius = avatarImageView.frame.height/2
        avatarImageView.clipsToBounds = true
    }

    override func viewWillAppear(_ animated: Bool) {
        setGradientBackground()
        super.viewWillAppear(animated)
    }
}
