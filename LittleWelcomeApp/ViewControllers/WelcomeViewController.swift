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
    var firstName = ""
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.textColor = .white
        welcomeLabel.text = "Welcome, \(firstName)!"
    }

    override func viewWillAppear(_ animated: Bool) {
        setGradientBackground()
        super.viewWillAppear(animated)
    }
}
