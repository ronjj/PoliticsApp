//
//  PoliticianRowView.swift
//  PoliticsApp
//
//  Created by Miranda Luo on 11/23/22.
//

import SwiftUI

struct PoliticianRowView: View {
    var polType: String
    var politicians: [String]
    
    var body: some View {
        HStack{
            Spacer()
            Text("\(polType)")
            Spacer()
            Circle()
                .frame(width: 20,height: 20)
            Spacer()
        }
    }
}
