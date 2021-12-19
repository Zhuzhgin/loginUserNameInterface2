//
//  UserInfoViewController.swift
//  loginUserNameInterface
//
//  Created by Artem Zhuzhgin on 19.12.2021.
//

import UIKit

class UserInfoViewController: UIViewController {

    @IBOutlet var userInfo: UILabel!
    
    var userAge: Int = 0
    var userName: String = ""
    var userMale: String = ""
    var userHobby: Character = " "
    var userPetType: Character = " "
    var userPetName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userInfo.text = """
    Пользователь - \(userName)
    Возраст - \(userAge)
    Пол - \(userMale)
    Хобби - \(userHobby)
"""
   
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let moreInfoVC = segue.destination as? MoreInfoViewController{
            moreInfoVC.userPetType = userPetType
            moreInfoVC.userPetName = userPetName
         }
    }
    
    @IBAction func moreInfoButtonPressed(_ sender: UIButton) {
        
        
    }
    

}
