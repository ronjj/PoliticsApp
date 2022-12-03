//
//  PoliticanInformationView.swift
//  PoliticsApp
//
//  Created by Ronald Jabouin on 12/2/22.
//

import SwiftUI

struct PoliticanInformationView: View {
    
    let rep: Representatives
    
    var body: some View {
        VStack{
            HStack{
                VStack{
                    Circle()
                        .frame(width: 75, height: 75)
                    Text(rep.title)
                }
                
                
                VStack{
                    Text(rep.name)
                        .font(.headline)
                    Text("Represents: \(rep.state)")
                        .font(.subheadline)
                    Text(rep.party)
                        .foregroundColor(rep.party == "Democrat" ?  .blue : .red)
                }
            }
            
            Text("Learn More \(rep.website)")
                .padding(.top, 10)
            Spacer()
        }
        
    }
}
