//
//  NewsAPIResponse.swift
//  PoliticsApp
//
//  Created by Ronald Jabouin on 11/24/22.
//

import Foundation

struct NewsAPIResposne: Decodable {
    
    let status: String
    let totalResults: Int?
    let articles: [Article]?
    
    let code: String?
    let message: String?
}

