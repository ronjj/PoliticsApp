//
//  NewsListView.swift
//  PoliticsApp
//
//  Created by Ronald Jabouin on 11/18/22.
//

import SwiftUI

struct ArticleListView: View {
    
    let articles: [Article]
    @State private var selectedArticle: Article?

    
    var body: some View {
        //CategoriesView()
        ScrollView (.horizontal){
            HStack{
                ForEach(Category.allCases){
                    ReusableCategoryButton(text: $0.text, selection: Category(rawValue:$0.text.lowercased()) ?? Category.general).tag($0)
                }
            }
        }
        .scrollIndicators(.hidden)
        .padding()
        List {
            ForEach(articles) { article in
                ArticleRowView(article: article)
                    .onTapGesture {
                        selectedArticle = article
                    }
            }
            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .sheet(item: $selectedArticle){
            SafariView(url: $0.articleURL)
                .edgesIgnoringSafeArea(.bottom)
        }
    }
}


