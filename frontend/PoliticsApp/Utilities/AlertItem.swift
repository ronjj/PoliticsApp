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

    //MARK: - User Alerts
    static let invalidForm  = AlertItem(title: Text("Invalid Form"),
                                            message: Text("Please make sure all fields in the form were filled out"),
                                            dismissButton: .default(Text("OK")))
    
    static let invalidZip = AlertItem(title: Text("Invalid Zip Code"),
                                            message: Text("Please make sure your zip code is correct"),
                                            dismissButton: .default(Text("OK")))
    
    static let userSaveSuccess = AlertItem(title: Text("Information Saved"),
                                            message: Text("Your zip code info was successfully saved. Please refresh view"),
                                            dismissButton: .default(Text("OK")))
    
    static let invalidUserData = AlertItem(title: Text("Profile Error"),
                                            message: Text("There was an error saving or retrieving your profile"),
                                            dismissButton: .default(Text("OK")))
}
