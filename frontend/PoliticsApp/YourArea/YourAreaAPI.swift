//
//  YourAreaAPI.swift
//  PoliticsApp
//
//  Created by Miranda Luo on 12/2/22.
//

import Foundation

struct YourAreaAPI {
    
    private let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
    
}
