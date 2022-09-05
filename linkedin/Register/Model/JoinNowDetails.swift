//
//  JoinNowDetails.swift
//  linkedin
//
//  Created by Divyansh Dwivedi on 14/07/22.
//

import Foundation

//MARK: -
struct RegisterDetails {
    var email: String
    var password: String
    var firstName: String
    var lastName: String
    var occupation: String
}

//MARK: -
extension RegisterDetails {
    static var new: RegisterDetails {
        RegisterDetails(email: "", password: "", firstName: "", lastName: "", occupation: "")
    }
}
