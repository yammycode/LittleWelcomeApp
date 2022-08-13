//
//  WelcomeViewController.swift
//  LittleWelcomeApp
//
//  Created by Anton Saltykov on 12.08.2022.
//

import UIKit

final class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!

    // MARK: - Public Properties
    var welcomeText: String!

    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.textColor = .white
        welcomeLabel.text = "Welcome, " + welcomeText
    }

    override func viewWillAppear(_ animated: Bool) {
        setGradientBackground()
        super.viewWillAppear(animated)
    }
    
    // MARK: - Private Methods
    private func setGradientBackground() {
        let colorTop =  UIColor(red: 1, green: 0.6, blue: 0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 1, green: 0.37, blue: 0.23, alpha: 1.0).cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds

        self.view.layer.insertSublayer(gradientLayer, at:0)
    }

}
