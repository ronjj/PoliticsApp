//
//  PoliticsAppApp.swift
//  PoliticsApp
//
//  Created by Ronald Jabouin on 11/18/22.
//

import SwiftUI

@main
struct PoliticsAppApp: App {
    
    @ObservedObject var userVM = UserVM()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear() {
                    userVM.retrieveUser()
                }
                .preferredColorScheme(userVM.user.darkMode ? .dark : .light)
        }
    }
}
