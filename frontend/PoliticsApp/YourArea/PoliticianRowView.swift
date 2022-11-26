//
//  PoliticianRowView.swift
//  PoliticsApp
//
//  Created by Miranda Luo on 11/23/22.
//

import SwiftUI

struct PoliticianRowView: View {
    
    @ObservedObject var userVM = UserVM()
    var body: some View {
        HStack{
            Spacer()
            Text("Senator for \(userVM.user.zipCode)")
            Spacer()
            Circle()
                .frame(width: 20,height: 20)
            Spacer()
        }
        .onAppear() {
            userVM.retrieveUser()
        }
    }
}
