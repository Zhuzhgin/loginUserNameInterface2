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
   // private let userName = "Art"
   // private let password = "000"
    
    let user = User.getUserInfo()
    
    
    // MARK: - Override methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let tabBarController = segue.destination as! UITabBarController
        
        guard let viewControllers = tabBarController.viewControllers else {return}
        
        //цикл по архиву VC табконтроллера
        for viewController in viewControllers {
            
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.userName = user[0].userName
            }
            
            // навигатор
            if let navigationVC = viewController as? UINavigationController {
                let userInfoVC = navigationVC.topViewController as! UserInfoViewController
                userInfoVC.userAge = user[0].userAge
                userInfoVC.userMale = user[0].userMale.rawValue
                userInfoVC.userName = user[0].userName
                userInfoVC.userHobby = user[0].userHobby.rawValue
                userInfoVC.title = user[0].userName
                
                userInfoVC.userPetType = user[0].userPet.typeOfPet.rawValue
                userInfoVC.userPetName = user[0].userPet.nameOfPet
                
            }
            
        }
        
    }
    
    // MARK: IB Action
    
    @IBAction func loginButtonPressed() {
        guard userNameTF.text == user[0].userLogin , passwordTF.text == user[0].password  else {
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

// MARK: - Alert Control
extension LoginViewController {
    
    func viewAlert (title: String, message: String, tag: Int) {
        let alert =  UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            switch tag {
            case 0: self.passwordTF.text = ""
            case 1 : self.userNameTF.text = self.user[0].userLogin
            default : self.passwordTF.text = self.user[0].password
            }
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
 }

// MARK: - Key Return Control
extension LoginViewController: UITextFieldDelegate {
    
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

