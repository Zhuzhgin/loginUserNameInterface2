//
//  ViewController.swift
//  loginUserNameInterface
//
//  Created by Artem Zhuzhgin on 17.12.2021.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    // MARK: - Private Properties
    private let userName = "Art"
    private let password = "000"
    
    // MARK: - Override methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let welcomeVC = segue.destination as? WelcomeViewController else {return}
            welcomeVC.userName = userNameTF.text!
        }
        
    // MARK: IB Action
    
    @IBAction func loginButtonPressed() {
        guard userNameTF.text == userName, passwordTF.text == password  else {
            passwordTF.text = ""
            viewAlert(title: "Error", message: "Incorrect password or name of user", tag: 0)
            return
        }
        performSegue(withIdentifier: "goToWelcomeVC", sender: nil)
    }
    
    @IBAction func helpButtonPressed(_ sender: UIButton) {
        switch sender.tag {
        case 1: viewAlert(title: "fogot user name?", message: "Input user name?", tag: 1)
        default: viewAlert(title: "fogot password", message: "Input pfssword?", tag: 2)
        }
    }
    
    @IBAction func unwindToLoginVC(_ unwindSegue: UIStoryboardSegue) {
            userNameTF.text = ""
            passwordTF.text = ""
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func viewAlert (title: String, message: String, tag: Int) {
        let alert =  UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            switch tag {
            case 0: self.passwordTF.text = ""
            case 1 : self.userNameTF.text = self.userName
            default : self.passwordTF.text = self.password
            }
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            loginButtonPressed()
          //  performSegue(withIdentifier: "goToWelcomeVC", sender: nil)
        }
        return true
    }
}

