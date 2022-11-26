//
//  ZipcodeView.swift
//  PoliticsApp
//
//  Created by Miranda Luo on 11/24/22.
//

import SwiftUI

struct ZipcodeView: View {
    @Binding var zip: String
    @State var currentZip: String
    
    var body: some View {
        NavigationView{
            VStack{
                TextField("Enter your zip code", text: $currentZip)
                Button {
                    zip = currentZip
                } label: {
                    Text("Submit")
                }
            }
        }
    }
}

