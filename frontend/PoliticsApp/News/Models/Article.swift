//
//  Article.swift
//  PoliticsApp
//
//  Created by Ronald Jabouin on 11/24/22.
//

import Foundation

fileprivate let relativeDateFormatter = RelativeDateTimeFormatter()

struct Article: Codable, Equatable, Identifiable {
    
    var id: String {
        url
    }
    
    let source: Source
   
    let title: String
    let url: String
    let publishedAt: Date
    
    let author: String?
    let description: String?
    let urlToImage: String?
    
    //Giving Default Values to Optional Values
    var authorText: String {
        author ?? ""
    }
    
    var captionText: String {
        "\(source.name) · \(relativeDateFormatter.localizedString(for: publishedAt, relativeTo: Date()))"
    }
    
    var descriptionText: String {
        description ?? ""
    }
    
    var articleURL: URL {
        URL(string: url)!
    }
    
    var imageURL: URL? {
        guard let urlToImage = urlToImage else {
            return nil
        }
        return URL(string: urlToImage)
    }
}

extension Article {
    static var previewData: [Article] {
        let previewDataURL = Bundle.main.url(forResource: "news", withExtension: "json")!
        let data = try! Data(contentsOf: previewDataURL)
        
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        
        let apiResponse = try! jsonDecoder.decode(NewsAPIResposne.self, from: data)
        return apiResponse.articles ?? []
    }
}


struct Source: Codable, Equatable {
    let name: String
}
