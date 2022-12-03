//
//  PoliticianRowView.swift
//  PoliticsApp
//
//  Created by Miranda Luo on 11/23/22.
//

import SwiftUI

struct PoliticianRowView: View {
    var polType: String
    var politicians: [Representatives]
    
    var body: some View {
        HStack(alignment: .top) {
            Text("\(polType):")
                .bold()
            VStack{
                if (politicians.count == 0) {
                    Text("None found for your area.")
                }
                else {
                    ForEach(politicians, id: \.self) { politician in
                        NavigationLink(destination: PoliticanInformationView(rep: politician)){
                            HStack {
                                Text(politician.name)
                                Spacer()
                                Circle()
                                    .frame(width: 20,height: 20)
                                    .foregroundColor(politician.party == "Democrat" ?  .blue : .red)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
            }
        }
        .frame(maxWidth: UIScreen.main.bounds.size.width - 100)
    }
}
