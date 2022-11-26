//
//  UserViewModel.swift
//  PoliticsApp
//
//  Created by Ronald Jabouin on 11/26/22.
//

import SwiftUI

final class UserVM: ObservableObject{
    
    @AppStorage("user") private var userData: Data?
    
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    var isValidForm: Bool {
        
        //Check if field is empty
        guard !user.zipCode.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
            
        }

        
        //Check if field is a valid zipcode
        //only numbers, length of 5, is a valid us zipcode
        
//        guard user.email.isValidEmail else{
//            alertItem = AlertContext.invalidEmail
//            return false
//        }
        
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
