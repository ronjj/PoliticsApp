//
//  ArticleNewsViewModel.swift
//  PoliticsApp
//
//  Created by Ronald Jabouin on 11/24/22.
//

import Foundation

enum DataFetchPhase<T> {
    
    case empty
    case success(T)
    case failure(Error)
}


struct FetchTaskToken: Equatable {
    var category: Category
    var token: Date
}


//Replaces the need to do Dispatch.main ...
//Makes everything happen on the main thread
@MainActor


class ArticleNewsViewModel: ObservableObject {
    
    //Whenever a published variavle changes, UI is updated
    @Published var phase = DataFetchPhase<[Article]>.empty
    @Published var fetchTaskToken: FetchTaskToken
    private let newsAPI = NewsAPI.shared
    
    init(articles: [Article]? = nil, selectedCategory: Category = .general) {
        if let articles = articles {
            self.phase = .success(articles)
        } else {
            self.phase = .empty
        }
        self.fetchTaskToken = FetchTaskToken(category: selectedCategory, token: Date())
    }
    
    func loadArticles() async {
        
        //will stop hitting API for now
       // phase = .success(Article.previewData)
        
        if Task.isCancelled { return }

        //Resets the UI
        phase = .empty

        do {
            let articles = try await newsAPI.fetch(from: fetchTaskToken.category)
            if Task.isCancelled { return }
            phase = .success(articles)
        } catch {
            if Task.isCancelled { return }
            print(error.localizedDescription)
            phase = .failure(error)
        }
    }
}
