//
//  ZipcodeView.swift
//  PoliticsApp
//
//  Created by Miranda Luo on 11/24/22.
//

import SwiftUI

struct ZipcodeView: View {
    @StateObject var userVM = UserVM()
    @State private var password = ""
    
    //TODO: Make screen refreshable and see if that can make the your area screen appear
    
    var body: some View {
        NavigationView{
            VStack {
                Form{
                    Section(header: Text("Log in")) {
                        TextField("Username", text: $userVM.user.name)
                        SecureField("Password", text: $password)
                        Button {
                            userVM.saveChanges()
                        } label: {
                            Text("Submit")
                        }
                    }
                    Section(header: Text("Sign up")) {
                        TextField("Username", text: $userVM.user.name)
                        SecureField("Password", text: $password)
                        TextField("Zip Code", text: $userVM.user.zipCode)
                            .keyboardType(.numberPad)
                        Button {
                            userVM.saveChanges()
                        } label: {
                            Text("Submit")
                        }
                    }
                }
            }
            .navigationTitle("Log in/Sign up")
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

