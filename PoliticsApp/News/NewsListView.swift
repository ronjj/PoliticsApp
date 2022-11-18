//
//  NewsListView.swift
//  PoliticsApp
//
//  Created by Ronald Jabouin on 11/18/22.
//

import SwiftUI

struct NewsListView: View {
    @State var news: [News] = News.dummyData
    
    var body: some View {
        
        ScrollView(.vertical) {
            VStack(alignment: .leading){
                ForEach($news) { news in
                    NavigationLink(destination: NewsDetailView(news: news)) {
                        NewsRowView(news: news)
                    }
                }
            }
        }
    }
}


