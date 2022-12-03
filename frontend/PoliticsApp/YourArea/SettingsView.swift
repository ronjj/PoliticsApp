//
//  SettingsView.swift
//  PoliticsApp
//
//  Created by Miranda Luo on 11/24/22.
//

import SwiftUI
import UIKit

struct SettingsView: View {
    
    @State private var presentAlert = false
    
    @ObservedObject var userVM = UserVM()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.colorScheme) var colorScheme

    
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
                        TextField("Zip Code", text: $userVM.user.zipCode)
                            .keyboardType(.numberPad)
                        Button("Confirm", action: {})
                        Button("Cancel", role: .cancel, action: {})
                    }, message: {
                        Text("Please enter your zip code.")
                    })
                    
                    Spacer()
                }
                VStack{
                    Toggle("Dark mode", isOn: $userVM.user.darkMode)
                    Toggle("Push notifications", isOn: $userVM.user.pushNotifs)
                    Toggle("Email notifications", isOn: $userVM.user.emailNotifs)
                    Button {
                        userVM.saveChanges()
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Save Changes")
                    }
                    .buttonStyle(.bordered)
                }
                .frame(maxWidth: UIScreen.main.bounds.size.width - 40)
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
                print(userVM.user)
            }
    }
    
}
