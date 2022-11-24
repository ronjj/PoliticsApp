//
//  ZipcodeView.swift
//  PoliticsApp
//
//  Created by Miranda Luo on 11/24/22.
//

import SwiftUI

struct ZipcodeView: View {
    @State private var zip: String = ""

    var body: some View {
        NavigationView{
            VStack{
                TextField("Enter your zip code", text: $zip)
                Text("Your zip is \(zip)")
            }
        }
    }
}

struct ZipcodeView_Previews: PreviewProvider {
    static var previews: some View {
        ZipcodeView()
    }
}
