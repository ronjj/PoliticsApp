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
        VStack{
            Text("Your zip code is \(userVM.user.zipCode).")
        }
    }
}
