//
//  ViewController.swift
//  LittleWelcomeApp
//
//  Created by Anton Saltykov on 12.08.2022.
//

import UIKit

final class LoginViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!

    // MARK: - Private Properties
    private let user = User.getUser()

    // MARK: - Override Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBar = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBar.viewControllers else { return }

        for viewController in viewControllers {
            setViewControllerData(for: viewController)
        }
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "authSegue" {
            guard checkEmptyUserNameTF() else { return false }
            guard checkEmptyPasswordTF() else { return false }
            guard checkAuthCorrect() else { return false }
        }
        return true
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }

    // MARK: - IBAction
    @IBAction func remindUserName() {
        showAlert(with: "Ooops", and: "Your User Name is \(user.username) 🤐")
    }

    @IBAction func remindPassword() {
        showAlert(with: "Ooops", and: "Your Password is \(user.password) 🫣")
    }

    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }

    // MARK: - Private Methods
    private func setViewControllerData(for viewController: UIViewController) {
        if let viewController = viewController as? WelcomeViewController {
            viewController.firstName = user.profile.firstName
        } else if let navigationVC = viewController as? UINavigationController {
            if let viewController = navigationVC.topViewController as? AboutViewController {
                setNavigationTitle(for: navigationVC, with: "ABOUT")
                setAboutData(for: viewController)
            } else if let viewController = navigationVC.topViewController as? PortfolioTableViewController {
                setNavigationTitle(for: navigationVC, with: "PORTFOLIO")
                viewController.portfolio = user.profile.portfolio
            } else if let viewController = navigationVC.topViewController as? SkillsViewController {
                setNavigationTitle(for: navigationVC, with: "SKILLS")
                viewController.skills = user.profile.skills
            }
        }
    }

    private func setNavigationTitle(for navigation: UINavigationController, with text: String) {
        navigation.navigationBar.topItem?.title = user.profile.fullName + ": \(text)"
    }

    private func setAboutData(for viewController: AboutViewController) {
        viewController.fullName = user.profile.fullName
        viewController.aboutText = user.profile.aboutText
        viewController.age = user.profile.age
        viewController.avatar = user.profile.avatar
    }

    private func checkEmptyUserNameTF() -> Bool {
        guard let userName = userNameTF.text, !userName.isEmpty else {
            showAlert(
                with: "Неа...",
                and: "Пожалуйста, вспомните как вас зовут и введите User Name",
                andFocusAfter: userNameTF
            )
            return false
        }
        return true
    }

    private func checkEmptyPasswordTF() -> Bool {
        guard let password = passwordTF.text, !password.isEmpty else {
            showAlert(
                with: "Неа...",
                and: "Пожалуйста, вводите корректный пароль",
                andFocusAfter: passwordTF
            )
            return false
        }
        return true
    }

    private func checkAuthCorrect() -> Bool {
        guard userNameTF.text == user.username && passwordTF.text == user.password else {
            showAlert(
                with: "Не пущу!!!",
                and: "И не уговаривай. Лучше проверь логин или пароль....",
                andFocusAfter: passwordTF
            )
            return false
        }
        return true
    }
}

// MARK: - Extensions
extension LoginViewController {
    private func showAlert(with title: String, and message: String, andFocusAfter textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.passwordTF.text = ""
            if let textField = textField {
                textField.becomeFirstResponder()
            }
        }

        alert.addAction(closeAction)
        present(alert, animated: true)
    }
}

