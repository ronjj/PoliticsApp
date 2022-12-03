//
//  YourAreaView.swift
//  PoliticsApp
//
//  Created by Miranda Luo on 11/20/22.
//

import SwiftUI

struct YourAreaView: View {
    
    // insert getting articles here
    @StateObject var articlesNewsVM = ArticleNewsViewModel()
    @StateObject var viewModel = ViewModel()
    @ObservedObject var userVM = UserVM()
    
    var body: some View {
        NavigationView {
                VStack {
                    PoliticianRowView(polType: "House", politicians: viewModel.representatives.filter({ $0.title != "Senator"}))
                    PoliticianRowView(polType: "Senate", politicians: viewModel.representatives.filter({ $0.title != "House" }))
                    HStack{
                        Text("Your News")
                            .font(.largeTitle)
                            .padding()
                        Spacer()
                    }
                    ArticleListView(articles: articles)
                        .overlay(overlayView)
                        .task(id: articlesNewsVM.fetchTaskToken, loadTask)
                        .refreshable(action: refreshTask)
            }
                .task {
                    await viewModel.fetch(zip: userVM.user.zipCode)
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
        .onAppear() {
            userVM.retrieveUser()
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
