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
        HStack(alignment: .top) {
            Text("\(polType):")
            VStack{
                ForEach(politicians, id: \.self) { politician in
                    HStack {
                        Text(politician)
                        Spacer()
                        Circle()
                            .frame(width: 20,height: 20)
                    }
                }
            }
        }
        .frame(maxWidth: UIScreen.main.bounds.size.width - 100)
    }
}
