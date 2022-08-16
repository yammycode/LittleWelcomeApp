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
    var firstName = ""
    var lastName = ""
    var age: Int!
    var aboutText = ""
    var avatar = ""


    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "\(firstName) \(lastName)"
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

    private func setGradientBackground() {
        let colorTop =  UIColor(red: 1, green: 0.6, blue: 0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 226/255, green: 158/255, blue: 41/255, alpha: 1.0).cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds

        self.view.layer.insertSublayer(gradientLayer, at:0)
    }


}
