//
//  NewsView.swift
//  PoliticsApp
//
//  Created by Ronald Jabouin on 11/18/22.
//

import SwiftUI

struct NewsTabView: View {
    
    @StateObject var articlesNewsVM = ArticleNewsViewModel()
    @State var searchText = ""
    
    var body: some View {
                
        NavigationView{
            ArticleListView(articles: articles)
                .overlay(overlawView)
            //whenever the selected category chnages, the data is reloaded
                .task(id: articlesNewsVM.fetchTaskToken, loadTask)
                .refreshable(action: refreshTask)
                .navigationTitle(articlesNewsVM.fetchTaskToken.category.text)
                .navigationBarItems(trailing: menu)
        }
        .searchable(text: $searchText)
    }
    
    @ViewBuilder
    private var overlawView: some View {
        
        switch articlesNewsVM.phase {
        case .empty:
            ProgressView()
            
        case .success(let articles) where articles.isEmpty:
            EmptyPlaceholderView(text: "No Articles", image: nil)
        case .failure(let error):
            RetryView(text: error.localizedDescription, retryAction: refreshTask)
            
            
        default:  EmptyView()
        }
        
    }
    
    private var articles: [Article] {
        
        if searchText.isEmpty {
            if case let .success(articles) = articlesNewsVM.phase {
                return articles
            } else {
                return []
            }
        } else {
            if case let .success(articles) = articlesNewsVM.phase {
                return articles
                    .filter{
                        $0.title.lowercased().contains(searchText.lowercased()) || $0.descriptionText.lowercased().contains(searchText.lowercased())
                    }
            } else {
                return []
            }
        }
        
        
    }
    
    private func loadTask() async {
        await articlesNewsVM.loadArticles()
    }
    
    private func refreshTask() {
        articlesNewsVM.fetchTaskToken = FetchTaskToken(category: articlesNewsVM.fetchTaskToken.category, token: Date())
    }
    
    
    private var menu: some View {
        Menu {
            Picker("Category", selection: $articlesNewsVM.fetchTaskToken.category) {
                ForEach(Category.allCases){
                    Text($0.text).tag($0)
                }
            }
        } label: {
            Image(systemName: "fiberchannel")
        }
    }
}

