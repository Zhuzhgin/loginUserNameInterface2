//
//  User1.swift
//  loginUserNameInterface
//
//  Created by Artem Zhuzhgin on 19.12.2021.
//

struct User {
    let userLogin: String
    let userName: String
    let password: String
    let userAge: Int
    let userMale: Male
    let userHobby: Hobby
    let userPet : Pet
    
    static func getUserInfo() -> [User] {
        [
            User(
                userLogin: "User",
                userName: "Artem Fox",
                password: "000",
                userAge: 43,
                userMale: .male,
                userHobby: .climb,
                userPet: .init(typeOfPet: .dog, nameOfPet: "Keks")
            )
            
        ]
    }
}

enum Hobby: Character {
    case bike = "🚲"
    case swim = "🏊🏼‍♀️"
    case climb = "🧗🏾‍♀️"
    case snowboard = "🏂"
}

enum Male: String {
    case male = "мужской"
    case female = "женский"
}

struct Pet {
    let typeOfPet: TypeOfPet
    let nameOfPet : String
}

enum TypeOfPet : Character {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
}
