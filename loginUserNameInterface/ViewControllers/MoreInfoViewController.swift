//
//  MoreInfoViewController.swift
//  loginUserNameInterface
//
//  Created by Artem Zhuzhgin on 19.12.2021.
//

import UIKit

class MoreInfoViewController: UIViewController {

    @IBOutlet var userPetLabel: UILabel!
    var userPetType: Character = " "
    var userPetName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userPetLabel.text = """
   Домашний питомец - \(userPetType)
   по кличке \(userPetName)
"""

    }


}
