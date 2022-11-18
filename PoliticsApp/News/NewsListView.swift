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
            VStack{
                ForEach($news) { news in
                    NewsRowView(news: news)
                    
                }
            }
        }
    }
}


