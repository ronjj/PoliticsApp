//
//  NewsAPI.swift
//  PoliticsApp
//
//  Created by Ronald Jabouin on 11/24/22.
//

import Foundation

struct NewsAPI {
    
    static let shared = NewsAPI()
    private init() {}
    
    private let apiKey = "29b4dbbb5aea4191a795f505c1a157ed"
    private let session = URLSession.shared
    private let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
    
    func fetch(from category: Category) async throws -> [Article] {
        try await fetchArticles(from: generalNewsURL(from: category))
    }
    
    func search(for query: String) async throws -> [Article] {
        try await fetchArticles(from: generateSearchURL(from: query))
    }
    
    private func fetchArticles(from url: URL) async throws -> [Article] {
        
        //async task
        let (data, response) = try await session.data(from: url)
        
        guard let response = response as? HTTPURLResponse else {
            throw generateError(description: "Bad Response")
            
        }
        
        switch response.statusCode {
        case(200...299), (400...499):
            let apiResponse = try jsonDecoder.decode(NewsAPIResposne.self, from: data)
            if apiResponse.status == "ok" {
                return apiResponse.articles ?? []
            } else {
                throw generateError(description: apiResponse.message ?? "An error occurred")
            }
            
        default:
            throw generateError(description: "A server error occurred")
        }
    }
    
    private func generateError(code: Int = 1, description: String) -> Error {
        NSError(domain: "NewsAPI", code: code, userInfo: [NSLocalizedDescriptionKey: description])
    }
    
    private func generalNewsURL(from category: Category) -> URL {
        var url = "https://newsapi.org/v2/top-headlines?country=us"
        url += "&apiKey=\(apiKey)"
        url += "&language=en"
        url += "&category=\(category.rawValue)"
        return URL(string: url)!
    }
    
    private func generateSearchURL(from query: String) -> URL {
        let percentEncodingString = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? query
        var url = "https://newsapi.org/v2/everything?"
        url += "&apiKey=\(apiKey)"
        url += "&language=en"
        url += "&q=\(percentEncodingString)"
        return URL(string: url)!
    }
}
