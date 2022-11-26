//
//  WrappedYourAreaView.swift
//  PoliticsApp
//
//  Created by Miranda Luo on 11/25/22.
//

import SwiftUI

struct WrappedYourAreaView: View {
    @State private var zip: String = ""
    
    var body: some View {
        if (zip == "") {
            ZipcodeView(zip: $zip, currentZip: "")
        }
        else {
            YourAreaView()
        }
    }
}

