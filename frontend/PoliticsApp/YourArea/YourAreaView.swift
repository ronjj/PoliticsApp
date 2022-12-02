//
//  YourAreaView.swift
//  PoliticsApp
//
//  Created by Miranda Luo on 11/20/22.
//

import SwiftUI

struct YourAreaView: View {
    
<<<<<<< HEAD
    @ObservedObject var articleNewsVM = ArticleNewsViewModel()
=======
    // insert getting articles here
    @StateObject var articlesNewsVM = ArticleNewsViewModel()
>>>>>>> 74d34b5cc330f1c1c94ed7b9391af904931ca9f6
    
    var body: some View {
        NavigationView{
//            ScrollView{
                VStack {
                    PoliticianRowView(polType: "House", politicians: ["Pol 1"])
                    PoliticianRowView(polType: "Senate", politicians: ["Pol 1", "Pol 2"])
                    HStack{
                        Text("Your News")
                            .font(.largeTitle)
                            .padding()
                        Spacer()
                    }
<<<<<<< HEAD
                }
=======
                    ArticleListView(articles: articles)
                        .overlay(overlayView)
                    //whenever the selected category chnages, the data is reloaded
                        .task(id: articlesNewsVM.fetchTaskToken, loadTask)
                        .refreshable(action: refreshTask)
//                }
>>>>>>> 74d34b5cc330f1c1c94ed7b9391af904931ca9f6
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
    
    private var articles: [Article] {
        if case let .success(articles) = articlesNewsVM.phase {
            return articles
        } else {
            return []
        }
    }
    
    @ViewBuilder
    private var overlayView: some View {
        
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
        
    private func loadTask() async {
        await articlesNewsVM.loadArticles()
    }
    
    private func refreshTask() {
        articlesNewsVM.fetchTaskToken = FetchTaskToken(category: articlesNewsVM.fetchTaskToken.category, token: Date())
    }
}
