//
//  YourAreaView.swift
//  PoliticsApp
//
//  Created by Miranda Luo on 11/20/22.
//

import SwiftUI

struct YourAreaView: View {
    
    // insert getting articles here

    var body: some View {
        NavigationView{
            ScrollView{
                VStack {
                    PoliticianRowView(polType: "House", politicians: ["Pol 1"])
                    PoliticianRowView(polType: "Senate", politicians: ["Pol 1", "Pol 2"])
                    HStack{
                        Text("Your News")
                            .font(.largeTitle)
                            .padding()
                        Spacer()
                    }
                   // ArticleListView(articles: vm.articles )
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
