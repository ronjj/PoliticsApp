//
//  SettingsView.swift
//  PoliticsApp
//
//  Created by Miranda Luo on 11/24/22.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var userVM = UserVM()
    var body: some View {
        NavigationView{
            VStack{
                Text("Your zip code is \(userVM.user.zipCode).")
                Spacer()
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
            .onAppear() {
                userVM.retrieveUser()
            }
        }
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
