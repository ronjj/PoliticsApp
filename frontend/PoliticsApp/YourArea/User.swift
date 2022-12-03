//
//  User.swift
//  PoliticsApp
//
//  Created by Ronald Jabouin on 11/26/22.
//

import SwiftUI

struct User: Codable {
    var name: String = ""
    var zipCode: String = ""
    var zipCodeEntered: Bool = false
    var sessionToken: String = ""
    
    // TODO: change this to a dictionary?
    var pushNotifs: Bool = false
    var emailNotifs: Bool = false
    var darkMode: Bool = false
}

extension String  {
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
}

