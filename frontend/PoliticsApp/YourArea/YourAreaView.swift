//
//  YourAreaView.swift
//  PoliticsApp
//
//  Created by Miranda Luo on 11/20/22.
//

import SwiftUI

struct YourAreaView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                VStack {
                    PoliticianRowView()
                    PoliticianRowView()
                    NewsListView()
                }
            }
            .navigationTitle("Your Area")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                NavigationLink {
                    SettingsView()
                } label: {
                    Label("Settings", systemImage: "gearshape")
                }
            }
        }
        
    }
}
