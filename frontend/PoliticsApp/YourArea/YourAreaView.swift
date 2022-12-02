//
//  YourAreaView.swift
//  PoliticsApp
//
//  Created by Miranda Luo on 11/20/22.
//

import SwiftUI

struct YourAreaView: View {
    
    @ObservedObject var articleNewsVM = ArticleNewsViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack {
                    PoliticianRowView(polType: "House")
                    PoliticianRowView(polType: "Senate")
                    HStack{
                        Text("News")
                            .font(.largeTitle)
                            .padding()
                        Spacer()
                    }
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
