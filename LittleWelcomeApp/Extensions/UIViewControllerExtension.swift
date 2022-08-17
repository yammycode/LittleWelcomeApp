//
//  UIViewControllerExtension.swift
//  LittleWelcomeApp
//
//  Created by Anton Saltykov on 17.08.2022.
//

import UIKit

extension UIViewController {
    func setGradientBackground() {
        let colorTop =  UIColor(red: 1, green: 0.6, blue: 0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 226/255, green: 158/255, blue: 41/255, alpha: 1.0).cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds

        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
}
