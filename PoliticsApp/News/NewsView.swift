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
                NewsListView()
            }
            .navigationTitle("News")
            .navigationBarTitleDisplayMode(.large)
            
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
