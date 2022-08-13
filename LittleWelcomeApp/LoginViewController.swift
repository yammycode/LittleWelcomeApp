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
    private let correctUserName = "User"
    private let correctPassword = "Password"

    // MARK: - Override Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }

        welcomeVC.welcomeText = userNameTF.text
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
        showAlert(with: "Ooops", and: "Your User Name is \(correctUserName) 🤐")
    }

    @IBAction func remindPassword() {
        showAlert(with: "Ooops", and: "Your Password is \(correctPassword) 🫣")
    }

    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }

    // MARK: - Private Methods
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
                and: """
В целях повышения уровня безопасности приложения ввод пустого пароля не допустим!
В случае возникновения трудностей с запоминанием пароля нажимите на кнопку "Forgot Password"
Никому не сообщайте пароль, который увидите, как бы сильно не хотелось! Это крайне секретная информация.
""",
                andFocusAfter: passwordTF
            )
            return false
        }
        return true
    }

    private func checkAuthCorrect() -> Bool {
        guard userNameTF.text == correctUserName && passwordTF.text == correctPassword else {
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
    private func showAlert(with title: String, and message: String, andFocusAfter: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.passwordTF.text = ""
            if let focusTFAfter = andFocusAfter {
                focusTFAfter.becomeFirstResponder()
            }
        }

        alert.addAction(closeAction)
        present(alert, animated: true)
    }
}

