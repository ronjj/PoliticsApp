//
//  YourAreaView.swift
//  PoliticsApp
//
//  Created by Miranda Luo on 11/20/22.
//

import SwiftUI

struct YourAreaView: View {
    var body: some View {
        ScrollView{
            VStack {
                PoliticianRowView()
                NewsListView()
            }
            .navigationTitle("Your Area")
            .navigationBarTitleDisplayMode(.large)
        }
        
    }
}

struct YourAreaView_Previews: PreviewProvider {
    static var previews: some View {
        YourAreaView()
    }
}
