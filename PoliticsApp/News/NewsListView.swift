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
        VStack{
            ForEach($news) { item in
                
                
            }
        }
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}
