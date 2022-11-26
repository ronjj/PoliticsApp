//
//  AlertItem.swift
//  PoliticsApp
//
//  Created by Ronald Jabouin on 11/26/22.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}


struct AlertContext{
    
    //MARK: - Network Alerts
    static let invalidData = AlertItem(title: Text("Server Error"),
                                       message: Text("The data recieved from the server was invalid"),
                                       dismissButton: .default(Text("OK")))
    
    static let invalidResponse = AlertItem(title: Text("Server Error"),
                                           message: Text("Invalid response form the server. Please try again later"),
                                           dismissButton: .default(Text("OK")))
    
    static let invalidURL = AlertItem(title: Text("Server Error"),
                                      message: Text("There was an issue connecting to the server."),
                                      dismissButton: .default(Text("OK")))
    
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                            message: Text("Unable to complete your request at this time. Please check your internet connection"),
                                            dismissButton: .default(Text("OK")))
    
    //MARK: - Account Alerts
    static let invalidForm  = AlertItem(title: Text("Invalid Form"),
                                            message: Text("Please make sure all fields in the form were filled out"),
                                            dismissButton: .default(Text("OK")))
    
    static let invalidEmail = AlertItem(title: Text("Invalid Email"),
                                            message: Text("Please make sure your email is correct"),
                                            dismissButton: .default(Text("OK")))
    
    static let userSaveSuccess = AlertItem(title: Text("Information Saved"),
                                            message: Text("Your zip code info was successfully saved. Please refresh view"),
                                            dismissButton: .default(Text("OK")))
    
    static let invalidUserData = AlertItem(title: Text("Profile Error"),
                                            message: Text("There was an error saving or retrieving your profile"),
                                            dismissButton: .default(Text("OK")))
    
    
}
