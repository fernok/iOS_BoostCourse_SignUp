//
//  UserInformation.swift
//  SignUp
//
//  Created by Hyuhng Min Kim on 2020/07/13.
//  Copyright © 2020 Hyuhng Min Kim. All rights reserved.
//

import Foundation

class UserInformation {
    static let shared: UserInformation = UserInformation()
    
    var id: String?
    var password: String?
    var explanation: String?
    var phone: String?
//    var image:
    var dateOfBirth: Date?
}
