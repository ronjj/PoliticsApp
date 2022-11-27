//
//  WrappedYourAreaView.swift
//  PoliticsApp
//
//  Created by Miranda Luo on 11/25/22.
//

import SwiftUI

struct WrappedYourAreaView: View {
    @StateObject var userVM = UserVM()
    
    var body: some View {
        ZStack{
            if (userVM.user.zipCode == "") {
                ZipcodeView()
            } else {
                YourAreaView()
            }
        }
        .onAppear{
            userVM.retrieveUser()
        }

    }
}

