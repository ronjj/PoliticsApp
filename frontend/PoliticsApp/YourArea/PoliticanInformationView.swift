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
        NavigationView{
            VStack {
                Text(rep.name)
                
            }
        }
    }
}
