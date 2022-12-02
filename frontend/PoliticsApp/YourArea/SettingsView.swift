//
//  SettingsView.swift
//  PoliticsApp
//
//  Created by Miranda Luo on 11/24/22.
//

import SwiftUI

struct SettingsView: View {
    
    // TODO: replace this with userVM stuff
    @State private var pushNotifs = false
    @State private var emailNotifs = false
    @State private var notifs = false
    @State private var darkMode = false
    
    @State private var presentAlert = false
    
    @ObservedObject var userVM = UserVM()
    var body: some View {
            VStack{
                HStack{
                    Text("Zipcode: \(userVM.user.zipCode)")
                        .padding()
                        .font(.title2)
                    
                    Button {
                        presentAlert = true
                    } label : {
                        Image(systemName: "pencil")
                    }
                    .alert("Edit Zip Code", isPresented: $presentAlert, actions: {
                        TextField("Username", text: $userVM.user.zipCode)
                            .keyboardType(.numberPad)
                        Button("Confirm", action: {
                            userVM.saveChanges()
                        })
                        Button("Cancel", role: .cancel, action: {})
                    }, message: {
                        Text("Please enter your zip code.")
                    })
                    
                    Spacer()
                }
                Spacer()
                HStack{
                    Text("Notifications")
                        .font(.title2)
                        .padding()
                    Spacer()
                }
                VStack{
                    Toggle("Dark mode", isOn: $darkMode)
                    Toggle("Push notifications", isOn: $pushNotifs)
                    Toggle("Email notifications", isOn: $emailNotifs)
                    Toggle("notifications...", isOn: $notifs)
                }
                Spacer()
                Text("Made by Henry Toll, Jaysion Hahn, Mikayla Lin, Miranda Luo, and Ronald Jabouin")
                    .multilineTextAlignment(.center)
                    .padding()
                    .foregroundColor(.gray)
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
            .onAppear() {
                userVM.retrieveUser()
            }
    }
    
}
