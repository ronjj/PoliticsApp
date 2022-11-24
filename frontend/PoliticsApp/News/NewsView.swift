//
//  NewsView.swift
//  PoliticsApp
//
//  Created by Ronald Jabouin on 11/18/22.
//

import SwiftUI

struct NewsView: View {
    var body: some View {
        NavigationView {
            VStack{
            
                //Mock Searchbar
                //Didn't put actual searchbar since
                //we dont have actual data yet
                Rectangle()
                    .frame(height: 30)
                    .foregroundColor(.gray)
                    .cornerRadius(8)
                    .padding()
                
                NewsListView()
            }
            .navigationTitle("News")
            .navigationBarTitleDisplayMode(.large)
            
        }
    }
}

