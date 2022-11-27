//
//  NewsDetailView.swift
//  PoliticsApp
//
//  Created by Ronald Jabouin on 11/18/22.
//

import SwiftUI

struct NewsDetailView: View {
    
    @Binding var news: News
    
    var body: some View {
        ScrollView{
            VStack{
                Text(news.headline)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Text(news.articleContents)
                    .font(.body)
                    
            }
        }
    }
}


