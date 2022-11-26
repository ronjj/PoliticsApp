//
//  YourAreaView.swift
//  PoliticsApp
//
//  Created by Miranda Luo on 11/20/22.
//

import SwiftUI

struct YourAreaView: View {
    @State private var isShowingSettings = false

    var body: some View {
        NavigationView{
            ScrollView{
                VStack {
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
