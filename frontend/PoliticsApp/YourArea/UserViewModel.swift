//
//  UserViewModel.swift
//  PoliticsApp
//
//  Created by Ronald Jabouin on 11/26/22.
//

import SwiftUI

final class UserVM: ObservableObject {
    @AppStorage("user") private var userData: Data?
    
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    // TODO: Find a database of zip codes for verification
    var isValidZip: Bool {
        return (user.zipCode.count == 5 || user.zipCode.count == 4) && user.zipCode.isNumber
    }
    
    var isValidForm: Bool {
        guard isValidZip else{
            alertItem = AlertContext.invalidZip
            return false
        }
        
        return true
    }
        
    func saveChanges() {
        guard isValidForm else { return }

        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSaveSuccess
        } catch {
            alertItem = AlertContext.invalidUserData
        }
        
    }
    
    func retrieveUser() {
        guard let userData = userData else { return }
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch{
            alertItem = AlertContext.invalidUserData
        }
    }
}
