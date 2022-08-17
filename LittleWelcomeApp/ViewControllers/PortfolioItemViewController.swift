//
//  PortfolioItemViewController.swift
//  LittleWelcomeApp
//
//  Created by Anton Saltykov on 16.08.2022.
//

import UIKit

final class PortfolioItemViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet var thumbImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!

    // MARK: - Public Properties
    var portfolioItem: Portfolio? = nil

    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        if let portfolioItem = portfolioItem {
            titleLabel.text = portfolioItem.siteName
            thumbImageView.image = UIImage(named: portfolioItem.siteImage)
            descriptionLabel.text = portfolioItem.siteDescription
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        setGradientBackground()
        super.viewWillAppear(animated)
    }

    // MARK: - IBAction
    @IBAction func openSite() {
        if let portfolioItem = portfolioItem, let url = URL(string: portfolioItem.siteUrl) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
