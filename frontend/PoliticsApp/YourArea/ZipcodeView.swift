//
//  ZipcodeView.swift
//  PoliticsApp
//
//  Created by Miranda Luo on 11/24/22.
//

import SwiftUI

struct ZipcodeView: View {
    @StateObject var userVM = UserVM()
    
    //TODO: Make screen refreshable and see if that can make the your area screen appear
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("Zip Code")) {
                    TextField("Enter your zip code", text: $userVM.user.zipCode)
                        .keyboardType(.numberPad)
                    Button {
                        userVM.saveChanges()
                    } label: {
                        Text("Submit")
                    }
                }
            }
            .navigationTitle("Your Zip Code")
        }
        .onAppear{
            userVM.retrieveUser()
        }
        .alert(item: $userVM.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

